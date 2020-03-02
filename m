Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A217A604
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:06:54 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D142C420400;
	Thu,  5 Mar 2020 14:06:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from m97134.mail.qiye.163.com (m97134.mail.qiye.163.com
	[220.181.97.134])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4460D420177
	for <drbd-dev@lists.linbit.com>; Mon,  2 Mar 2020 13:32:54 +0100 (CET)
Received: from [192.168.9.200] (unknown [101.207.233.66])
	by smtp5 (Coremail) with SMTP id huCowAD3_9e__FxeUoa4AA--.2724S2;
	Mon, 02 Mar 2020 20:31:59 +0800 (CST)
From: Zhang Duan <duan.zhang@easystack.cn>
To: drbd-dev@lists.linbit.com
Message-ID: <76806ec7-77fd-56b9-96f5-954cfcb24eee@easystack.cn>
Date: Mon, 2 Mar 2020 20:31:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
X-CM-TRANSID: huCowAD3_9e__FxeUoa4AA--.2724S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUyE4EDUUUU
X-Originating-IP: [101.207.233.66]
X-CM-SenderInfo: hgxd0hx2kd0w46hd255vwduygofq/1tbiPh-ajlbdHAp-uwAAss
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:06:47 +0100
Cc: "dongsheng.yang" <dongsheng.yang@easystack.cn>
Subject: [Drbd-dev] [PATCH] drbd: Ignore negotiation result with the peer
 who is also negotiating
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
Content-Type: multipart/mixed; boundary="===============3609793019349931264=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This is a multi-part message in MIME format.
--===============3609793019349931264==
Content-Type: multipart/alternative;
 boundary="------------A2B9B3EB9981DF692CBF92DA"

This is a multi-part message in MIME format.
--------------A2B9B3EB9981DF692CBF92DA
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit


We have a test on 3 nodes cluster in which the primary is uptodate and 
the other two secondary
is diskless by doing drbdadm detach. Then after doing drbdadm attach on 
the two secondary at
the same time, one status hangs at NEGOTIATING while another hangs at 
ATTACHING.

That is because if a negotiating peer receives another's 
wide-cluster-change from DISKLESS to
NEGOTIATING, it will reject it due to more than one negotiation 
throughout the cluster, but the
new disk state of that node remains NEGOTIATING after a failed state 
change. Then neither of
two peers can get a negotiating result what they want.

Signed-off-by: ZhangDuan
---
drbd/drbd_state.c | 4 +++-
1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index c919d759..85910f1e 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -1835,8 +1835,10 @@ static void sanitize_state(struct drbd_resource 
*resource)
for_each_peer_device_rcu(peer_device, device) {
enum drbd_repl_state nr = peer_device->negotiation_result;
enum drbd_disk_state pdsk = peer_device->disk_state[NEW];
+ enum drbd_disk_state pdsk_old = peer_device->disk_state[OLD];

- if (pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING)
+ if ((pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING) ||
+ (pdsk_old < D_NEGOTIATING && pdsk == D_NEGOTIATING))
continue;

if (pdsk == D_UP_TO_DATE)
-- 
2.24.0.windows.2

-- 
Sincerely Yours,
Zhang Duan


--------------A2B9B3EB9981DF692CBF92DA
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    We have a test on 3 nodes cluster in which the primary is uptodate
    and the other two secondary<br>
    is diskless by doing drbdadm detach. Then after doing drbdadm attach
    on the two secondary at<br>
    the same time, one status hangs at NEGOTIATING while another hangs
    at ATTACHING.<br>
    <br>
    That is because if a negotiating peer receives another's
    wide-cluster-change from DISKLESS to<br>
    NEGOTIATING, it will reject it due to more than one negotiation
    throughout the cluster, but the<br>
    new disk state of that node remains NEGOTIATING after a failed state
    change. Then neither of<br>
    two peers can get a negotiating result what they want.<br>
    <br>
    Signed-off-by: ZhangDuan <duan.zhang@easystack.cn><br>
      ---<br>
      drbd/drbd_state.c | 4 +++-<br>
      1 file changed, 3 insertions(+), 1 deletion(-)<br>
      <br>
      diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c<br>
      index c919d759..85910f1e 100644<br>
      --- a/drbd/drbd_state.c<br>
      +++ b/drbd/drbd_state.c<br>
      @@ -1835,8 +1835,10 @@ static void sanitize_state(struct
      drbd_resource *resource)<br>
      for_each_peer_device_rcu(peer_device, device) {<br>
      enum drbd_repl_state nr = peer_device-&gt;negotiation_result;<br>
      enum drbd_disk_state pdsk = peer_device-&gt;disk_state[NEW];<br>
      + enum drbd_disk_state pdsk_old = peer_device-&gt;disk_state[OLD];<br>
      <br>
      - if (pdsk == D_UNKNOWN || pdsk &lt; D_NEGOTIATING)<br>
      + if ((pdsk == D_UNKNOWN || pdsk &lt; D_NEGOTIATING) ||<br>
      + (pdsk_old &lt; D_NEGOTIATING &amp;&amp; pdsk == D_NEGOTIATING))<br>
      continue;<br>
      <br>
      if (pdsk == D_UP_TO_DATE)<br>
      -- <br>
      2.24.0.windows.2<br>
      <br>
    </duan.zhang@easystack.cn>
    <pre class="moz-signature" cols="72">-- 
Sincerely Yours,
Zhang Duan</pre>
  </body>
</html>

--------------A2B9B3EB9981DF692CBF92DA--


--===============3609793019349931264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============3609793019349931264==--

