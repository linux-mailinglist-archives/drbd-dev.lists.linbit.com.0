Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDB914251
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 07:52:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18908420653;
	Mon, 24 Jun 2024 07:52:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 337 seconds by postgrey-1.31 at mail19;
	Mon, 24 Jun 2024 07:52:01 CEST
Received: from mail-m32111.qiye.163.com (mail-m32111.qiye.163.com
	[220.197.32.111])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 044324205F6
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 07:52:01 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 446A77E0689
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:20 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 01/11] drbd_nl: dont allow detating to be inttrupted in
	waiting D_DETACHING to DISKLESS
Date: Mon, 24 Jun 2024 13:46:09 +0800
Message-Id: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh9CVkNKSEwdGB4YT0JNGFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7ed24022ckunm446a77e0689
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46Ijo*CDctKgIiTigpHCwo
	SBJPFD1VSlVKTEpCSUtMQkNLTU1KVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlNSkw3Bg++
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

From: Dongsheng Yang <dongsheng.yang@easystack.cn>

In our network failure and drbd down testing, we found warning in dmesg and drbd down process into D state:

"kernel: drbd /unregistered/ramtest3/0 drbd103: ASSERTION device->disk_state[NOW] == D_FAILED || device->disk_state[NOW] == D_DETACHING FAILED in go_diskless"

the problem is the wait_event is inttruptable, it could be intrupted by signal and call drbd_cleanup_device before go_diskless()

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_nl.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 530334e61..7b4539431 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -3676,7 +3676,7 @@ static int adm_detach(struct drbd_device *device, bool force, bool intentional_d
 		      const char *tag, struct sk_buff *reply_skb)
 {
 	const char *err_str = NULL;
-	int ret, retcode;
+	int retcode;
 
 	device->device_conf.intentional_diskless = intentional_diskless;
 	if (force) {
@@ -3692,19 +3692,16 @@ static int adm_detach(struct drbd_device *device, bool force, bool intentional_d
 			CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE, tag, &err_str));
 	/* D_DETACHING will transition to DISKLESS. */
 	drbd_resume_io(device);
-	ret = wait_event_interruptible(device->misc_wait,
-			get_disk_state(device) != D_DETACHING);
+	wait_event(device->misc_wait, get_disk_state(device) != D_DETACHING);
 	if (retcode >= SS_SUCCESS) {
 		/* wait for completion of drbd_ldev_destroy() */
-		wait_event_interruptible(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
+		wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
 		drbd_cleanup_device(device);
 	}
 	else
 		device->device_conf.intentional_diskless = false;
 	if (retcode == SS_IS_DISKLESS)
 		retcode = SS_NOTHING_TO_DO;
-	if (ret)
-		retcode = ERR_INTR;
 out:
 	if (err_str) {
 		drbd_msg_put_info(reply_skb, err_str);
-- 
2.27.0

