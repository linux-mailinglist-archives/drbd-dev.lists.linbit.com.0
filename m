Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700D3526D6
	for <lists+drbd-dev@lfdr.de>; Fri,  2 Apr 2021 09:07:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BDA34205E8;
	Fri,  2 Apr 2021 09:07:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F2E542016E
	for <drbd-dev@lists.linbit.com>; Fri,  2 Apr 2021 09:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=ihhkC3A/F/
	n4R822QWItgpMZvdBrG7arMx9rRqjzjOs=; b=n+AzCCE6kLnYjWwY+MgmuGFO8U
	DXUJnP2P0HBr7cJKU0HqSF6Wbo8W9YaAec90EJZQvF2J59JRCMpYznS/whByDPZU
	uOxnMgrEcbVvhS9uHUibOWt2SmPrILlbA/QD25ws09WzAKKOf7q/sk9V3XR3t8q/
	F1i62T2tBqW8FRe+Y=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
	by newmailweb.ustc.edu.cn (Coremail) with SMTP id
	LkAmygDn7aWkwmZgSQyIAA--.4212S4; 
	Fri, 02 Apr 2021 15:07:16 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	axboe@kernel.dk
Date: Fri,  2 Apr 2021 00:07:13 -0700
Message-Id: <20210402070713.4069-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDn7aWkwmZgSQyIAA--.4212S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tryftFyfZF1fuF47XrW5Wrg_yoW8KF13pa
	yUW3sakF4DKa1kuFy7Cw18ZF9093ykGr98KrWUX347JFsxArsYqa4DKa45AF4rGrZ7GFW5
	J3W2vFn5Ca92y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUvNtcUUUUU=
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
Cc: linux-block@vger.kernel.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2] drbd: Fix a use after free in
	get_initial_state
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

In get_initial_state, it calls notify_initial_state_done(skb,..) if
cb->args[5]==1. I see that if genlmsg_put() failed in
notify_initial_state_done(), the skb will be freed by nlmsg_free(skb).
Then get_initial_state will goto out and the freed skb will be used by
return value skb->len.

My patch converts the type of notify_initial_state_done() from void to
int. So when errors occurs in notify_initial_state_done(), it can
return an error code. My patch also use err propagate the error and avoid
use the freed skb.

Fixes: a29728463b254 ("drbd: Backport the "events2" command")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/block/drbd/drbd_nl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index bf7de4c7b96c..21035ff460da 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -4861,7 +4861,7 @@ void notify_helper(enum drbd_notification_type type,
 		 err, seq);
 }
 
-static void notify_initial_state_done(struct sk_buff *skb, unsigned int seq)
+static int notify_initial_state_done(struct sk_buff *skb, unsigned int seq)
 {
 	struct drbd_genlmsghdr *dh;
 	int err;
@@ -4875,11 +4875,12 @@ static void notify_initial_state_done(struct sk_buff *skb, unsigned int seq)
 	if (nla_put_notification_header(skb, NOTIFY_EXISTS))
 		goto nla_put_failure;
 	genlmsg_end(skb, dh);
-	return;
+	return 0;
 
 nla_put_failure:
 	nlmsg_free(skb);
 	pr_err("Error %d sending event. Event seq:%u\n", err, seq);
+	return err;
 }
 
 static void free_state_changes(struct list_head *list)
@@ -4905,6 +4906,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	struct drbd_state_change *state_change = (struct drbd_state_change *)cb->args[0];
 	unsigned int seq = cb->args[2];
 	unsigned int n;
+	int err;
 	enum drbd_notification_type flags = 0;
 
 	/* There is no need for taking notification_mutex here: it doesn't
@@ -4914,7 +4916,9 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 
 	cb->args[5]--;
 	if (cb->args[5] == 1) {
-		notify_initial_state_done(skb, seq);
+		err = notify_initial_state_done(skb, seq);
+		if (err)
+			return err;
 		goto out;
 	}
 	n = cb->args[4]++;
-- 
2.25.1


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
