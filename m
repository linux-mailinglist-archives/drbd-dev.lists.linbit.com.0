Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F7776768
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Aug 2023 20:35:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10B89420AFF;
	Wed,  9 Aug 2023 20:35:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 496 seconds by postgrey-1.31 at mail19;
	Wed, 09 Aug 2023 20:35:13 CEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 26F3B42066F
	for <drbd-dev@lists.linbit.com>;
	Wed,  9 Aug 2023 20:35:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DAD564405;
	Wed,  9 Aug 2023 18:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1981BC433C7;
	Wed,  9 Aug 2023 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691605615;
	bh=pSpFDRAwbtsqqTy/Gg9NvkF9mNRiZQjn3R79AEmTYZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WiKr/1qJaI8U/DfPVMMKYyp4iMyqVTLLRN0P82rXkOOBvyu20FibFrpKKMP2kh7ro
	3NLj8VJE2LXctFGo+mcfSvoA3IvdtEi0FQHFjXAEqAjSBzLzPYcIsE6+tYsVwC+Sa/
	QXymisnJAX0kRcfGIKTWyddExHBXGO+3pnyfdNQnQt4d3OiQ1/FxnfXuC1vySeDZZw
	GtIQhTHVVR3p+lYUWRllVIM4q0y4Hy18AWrcNxbRE3yO3fXQ46zvP1KpDKt7Ufq1cU
	RSSoDcQs4hrI+CjZgToim1ophL8benZ4R3Dc3Q7hqra1Y2QexF/KXXJsZpIu670DP2
	taoVjXnto/wyA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Date: Wed,  9 Aug 2023 11:26:41 -0700
Message-ID: <20230809182648.1816537-4-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809182648.1816537-1-kuba@kernel.org>
References: <20230809182648.1816537-1-kuba@kernel.org>
MIME-Version: 1.0
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, jiri@resnulli.us,
	netdev@vger.kernel.org, dev@openvswitch.org,
	philipp.reisner@linbit.com, pshelar@ovn.org, jmaloy@redhat.com,
	edumazet@google.com, tipc-discussion@lists.sourceforge.net,
	ying.xue@windriver.com, Jakub Kicinski <kuba@kernel.org>,
	johannes@sipsolutions.net, pabeni@redhat.com,
	drbd-dev@lists.linbit.com, lars.ellenberg@linbit.com,
	jacob.e.keller@intel.com
Subject: [Drbd-dev] [PATCH net-next 03/10] genetlink: remove userhdr from
	struct genl_info
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

Only three families use info->userhdr and fixed headers
are discouraged for new families. So remove the pointer
from struct genl_info to save some space. Compute
the header pointer at runtime. Saved space will be used
for a family pointer in later patches.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: philipp.reisner@linbit.com
CC: lars.ellenberg@linbit.com
CC: christoph.boehmwalder@linbit.com
CC: axboe@kernel.dk
CC: pshelar@ovn.org
CC: jmaloy@redhat.com
CC: ying.xue@windriver.com
CC: jacob.e.keller@intel.com
CC: drbd-dev@lists.linbit.com
CC: linux-block@vger.kernel.org
CC: dev@openvswitch.org
CC: tipc-discussion@lists.sourceforge.net
---
 drivers/block/drbd/drbd_nl.c |  9 +++++----
 include/net/genetlink.h      |  7 +++++--
 net/netlink/genetlink.c      |  1 -
 net/openvswitch/conntrack.c  |  2 +-
 net/openvswitch/datapath.c   | 29 ++++++++++++++++-------------
 net/openvswitch/meter.c      | 10 +++++-----
 net/tipc/netlink_compat.c    |  2 +-
 7 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index cddae6f4b00f..d3538bd83fb3 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -159,7 +159,7 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	struct sk_buff *skb, struct genl_info *info, unsigned flags)
 {
-	struct drbd_genlmsghdr *d_in = info->userhdr;
+	struct drbd_genlmsghdr *d_in = genl_info_userhdr(info);
 	const u8 cmd = info->genlhdr->cmd;
 	int err;
 
@@ -1396,8 +1396,9 @@ static void drbd_suspend_al(struct drbd_device *device)
 
 static bool should_set_defaults(struct genl_info *info)
 {
-	unsigned flags = ((struct drbd_genlmsghdr*)info->userhdr)->flags;
-	return 0 != (flags & DRBD_GENL_F_SET_DEFAULTS);
+	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
+
+	return 0 != (dh->flags & DRBD_GENL_F_SET_DEFAULTS);
 }
 
 static unsigned int drbd_al_extents_max(struct drbd_backing_dev *bdev)
@@ -4276,7 +4277,7 @@ static void device_to_info(struct device_info *info,
 int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
-	struct drbd_genlmsghdr *dh = info->userhdr;
+	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
 	enum drbd_ret_code retcode;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
diff --git a/include/net/genetlink.h b/include/net/genetlink.h
index 0366d0925596..9dc21ec15734 100644
--- a/include/net/genetlink.h
+++ b/include/net/genetlink.h
@@ -95,7 +95,6 @@ struct genl_family {
  * @snd_portid: netlink portid of sender
  * @nlhdr: netlink message header
  * @genlhdr: generic netlink message header
- * @userhdr: user specific header
  * @attrs: netlink attributes
  * @_net: network namespace
  * @user_ptr: user pointers
@@ -106,7 +105,6 @@ struct genl_info {
 	u32			snd_portid;
 	const struct nlmsghdr *	nlhdr;
 	struct genlmsghdr *	genlhdr;
-	void *			userhdr;
 	struct nlattr **	attrs;
 	possible_net_t		_net;
 	void *			user_ptr[2];
@@ -123,6 +121,11 @@ static inline void genl_info_net_set(struct genl_info *info, struct net *net)
 	write_pnet(&info->_net, net);
 }
 
+static inline void *genl_info_userhdr(const struct genl_info *info)
+{
+	return (u8 *)info->genlhdr + GENL_HDRLEN;
+}
+
 #define GENL_SET_ERR_MSG(info, msg) NL_SET_ERR_MSG((info)->extack, msg)
 
 #define GENL_SET_ERR_MSG_FMT(info, msg, args...) \
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 0d4285688ab9..f98f730bb245 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -943,7 +943,6 @@ static int genl_family_rcv_msg_doit(const struct genl_family *family,
 	info.snd_portid = NETLINK_CB(skb).portid;
 	info.nlhdr = nlh;
 	info.genlhdr = nlmsg_data(nlh);
-	info.userhdr = nlmsg_data(nlh) + GENL_HDRLEN;
 	info.attrs = attrbuf;
 	info.extack = extack;
 	genl_info_net_set(&info, net);
diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index fa955e892210..03a6220b7d99 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -1604,7 +1604,7 @@ static struct sk_buff *
 ovs_ct_limit_cmd_reply_start(struct genl_info *info, u8 cmd,
 			     struct ovs_header **ovs_reply_header)
 {
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct sk_buff *skb;
 
 	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index a6d2a0b1aa21..80f5f755b0e6 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -589,7 +589,7 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 
 static int ovs_packet_cmd_execute(struct sk_buff *skb, struct genl_info *info)
 {
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct net *net = sock_net(skb->sk);
 	struct nlattr **a = info->attrs;
 	struct sw_flow_actions *acts;
@@ -966,7 +966,7 @@ static int ovs_flow_cmd_new(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net *net = sock_net(skb->sk);
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct sw_flow *flow = NULL, *new_flow;
 	struct sw_flow_mask mask;
 	struct sk_buff *reply;
@@ -1213,7 +1213,7 @@ static int ovs_flow_cmd_set(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net *net = sock_net(skb->sk);
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct sw_flow_key key;
 	struct sw_flow *flow;
 	struct sk_buff *reply = NULL;
@@ -1314,7 +1314,7 @@ static int ovs_flow_cmd_set(struct sk_buff *skb, struct genl_info *info)
 static int ovs_flow_cmd_get(struct sk_buff *skb, struct genl_info *info)
 {
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct net *net = sock_net(skb->sk);
 	struct sw_flow_key key;
 	struct sk_buff *reply;
@@ -1373,7 +1373,7 @@ static int ovs_flow_cmd_get(struct sk_buff *skb, struct genl_info *info)
 static int ovs_flow_cmd_del(struct sk_buff *skb, struct genl_info *info)
 {
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct net *net = sock_net(skb->sk);
 	struct sw_flow_key key;
 	struct sk_buff *reply;
@@ -1641,7 +1641,7 @@ static void ovs_dp_reset_user_features(struct sk_buff *skb,
 {
 	struct datapath *dp;
 
-	dp = lookup_datapath(sock_net(skb->sk), info->userhdr,
+	dp = lookup_datapath(sock_net(skb->sk), genl_info_userhdr(info),
 			     info->attrs);
 	if (IS_ERR(dp))
 		return;
@@ -1934,7 +1934,8 @@ static int ovs_dp_cmd_del(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-	dp = lookup_datapath(sock_net(skb->sk), info->userhdr, info->attrs);
+	dp = lookup_datapath(sock_net(skb->sk), genl_info_userhdr(info),
+			     info->attrs);
 	err = PTR_ERR(dp);
 	if (IS_ERR(dp))
 		goto err_unlock_free;
@@ -1967,7 +1968,8 @@ static int ovs_dp_cmd_set(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-	dp = lookup_datapath(sock_net(skb->sk), info->userhdr, info->attrs);
+	dp = lookup_datapath(sock_net(skb->sk), genl_info_userhdr(info),
+			     info->attrs);
 	err = PTR_ERR(dp);
 	if (IS_ERR(dp))
 		goto err_unlock_free;
@@ -2002,7 +2004,8 @@ static int ovs_dp_cmd_get(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-	dp = lookup_datapath(sock_net(skb->sk), info->userhdr, info->attrs);
+	dp = lookup_datapath(sock_net(skb->sk), genl_info_userhdr(info),
+			     info->attrs);
 	if (IS_ERR(dp)) {
 		err = PTR_ERR(dp);
 		goto err_unlock_free;
@@ -2245,7 +2248,7 @@ static void ovs_update_headroom(struct datapath *dp, unsigned int new_headroom)
 static int ovs_vport_cmd_new(struct sk_buff *skb, struct genl_info *info)
 {
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct vport_parms parms;
 	struct sk_buff *reply;
 	struct vport *vport;
@@ -2347,7 +2350,7 @@ static int ovs_vport_cmd_set(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-	vport = lookup_vport(sock_net(skb->sk), info->userhdr, a);
+	vport = lookup_vport(sock_net(skb->sk), genl_info_userhdr(info), a);
 	err = PTR_ERR(vport);
 	if (IS_ERR(vport))
 		goto exit_unlock_free;
@@ -2403,7 +2406,7 @@ static int ovs_vport_cmd_del(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-	vport = lookup_vport(sock_net(skb->sk), info->userhdr, a);
+	vport = lookup_vport(sock_net(skb->sk), genl_info_userhdr(info), a);
 	err = PTR_ERR(vport);
 	if (IS_ERR(vport))
 		goto exit_unlock_free;
@@ -2446,7 +2449,7 @@ static int ovs_vport_cmd_del(struct sk_buff *skb, struct genl_info *info)
 static int ovs_vport_cmd_get(struct sk_buff *skb, struct genl_info *info)
 {
 	struct nlattr **a = info->attrs;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct sk_buff *reply;
 	struct vport *vport;
 	int err;
diff --git a/net/openvswitch/meter.c b/net/openvswitch/meter.c
index c4ebf810e4b1..cc08e0403909 100644
--- a/net/openvswitch/meter.c
+++ b/net/openvswitch/meter.c
@@ -211,7 +211,7 @@ ovs_meter_cmd_reply_start(struct genl_info *info, u8 cmd,
 			  struct ovs_header **ovs_reply_header)
 {
 	struct sk_buff *skb;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 
 	skb = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
 	if (!skb)
@@ -272,7 +272,7 @@ static int ovs_meter_cmd_reply_stats(struct sk_buff *reply, u32 meter_id,
 
 static int ovs_meter_cmd_features(struct sk_buff *skb, struct genl_info *info)
 {
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct ovs_header *ovs_reply_header;
 	struct nlattr *nla, *band_nla;
 	struct sk_buff *reply;
@@ -409,7 +409,7 @@ static int ovs_meter_cmd_set(struct sk_buff *skb, struct genl_info *info)
 	struct dp_meter *meter, *old_meter;
 	struct sk_buff *reply;
 	struct ovs_header *ovs_reply_header;
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct dp_meter_table *meter_tbl;
 	struct datapath *dp;
 	int err;
@@ -482,7 +482,7 @@ static int ovs_meter_cmd_set(struct sk_buff *skb, struct genl_info *info)
 
 static int ovs_meter_cmd_get(struct sk_buff *skb, struct genl_info *info)
 {
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct ovs_header *ovs_reply_header;
 	struct nlattr **a = info->attrs;
 	struct dp_meter *meter;
@@ -535,7 +535,7 @@ static int ovs_meter_cmd_get(struct sk_buff *skb, struct genl_info *info)
 
 static int ovs_meter_cmd_del(struct sk_buff *skb, struct genl_info *info)
 {
-	struct ovs_header *ovs_header = info->userhdr;
+	struct ovs_header *ovs_header = genl_info_userhdr(info);
 	struct ovs_header *ovs_reply_header;
 	struct nlattr **a = info->attrs;
 	struct dp_meter *old_meter;
diff --git a/net/tipc/netlink_compat.c b/net/tipc/netlink_compat.c
index 9b47c8409231..299cd6754f14 100644
--- a/net/tipc/netlink_compat.c
+++ b/net/tipc/netlink_compat.c
@@ -1294,7 +1294,7 @@ static int tipc_nl_compat_recv(struct sk_buff *skb, struct genl_info *info)
 	struct tipc_nl_compat_msg msg;
 	struct nlmsghdr *req_nlh;
 	struct nlmsghdr *rep_nlh;
-	struct tipc_genlmsghdr *req_userhdr = info->userhdr;
+	struct tipc_genlmsghdr *req_userhdr = genl_info_userhdr(info);
 
 	memset(&msg, 0, sizeof(msg));
 
-- 
2.41.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
