Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 03871989ABE
	for <lists+drbd-dev@lfdr.de>; Mon, 30 Sep 2024 08:42:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 569E84205E3;
	Mon, 30 Sep 2024 08:42:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1099 seconds by postgrey-1.31 at mail19;
	Fri, 27 Sep 2024 12:31:09 CEST
Received: from APC01-PSA-obe.outbound.protection.outlook.com
	(mail-psaapc01on2080.outbound.protection.outlook.com [40.107.255.80])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00C08420312
	for <drbd-dev@lists.linbit.com>; Fri, 27 Sep 2024 12:31:09 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=EsaiL8wfFWgRou/bEWjcsOyo2gNPWqBEQC1u4ZXuogF8PVbOUl/InKaFFGyCKaP+RATHUaQeNxmBwwvVGXDrj3r+u56MaICYbN77x831hohAH2yJSXmqXDj5LLsQ34/o/sLTeUVx0PzCGIIZcdLH7T8rui5IMazekUR90mqRAsWHb0hk4rgcAQxe/nDAE8tinT8uv+hBncVJCZ1j7gW3retXte5AAiAFuKqLr6hZjSlvncd2OI7dgelJ6xdev+g7BSGaz0FcxGAttPeGvoJH6KXg7KbtQeUlCvVnl0X5sbqqA+vnmkKoLww6T8zVoMpUzOgACs9iuEGm5En4FxnMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=NfH3v+Fk1r4Uxk/WkLcTkJRvq4ieXkeOTFyr3qU24lY=;
	b=BUvdgiGH9fSFwkjjVTdcwtyS8Kn+TPb5nD0vDN6c60d2CJheLH6QHaFird/7mGDyjEZrQ7hWKjg8YZHtmWxU17dawy8Q3jSLl3lJwuyfzAiNVHV8J7KSqyY6axvs2Z6nzRVjCPEnnPksOOXHVSFx5sfs/mDRpBbTouaCO+AnNI8wbKkpYK5MtbmeV+ZJyxjQFlz48P0tg2cW7j2hqledu69iwptkX/rFmZBUCQU5KhYtFMoqEC65IVrGUkeMv9JhlqMftLd1wElJGGi03GabtOHCQwLyID40bBlEUOCwQZdBDk9KdH7tld2y7+yVb5CGCDho21rOJ5pGHh3fP8Cdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
	dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NfH3v+Fk1r4Uxk/WkLcTkJRvq4ieXkeOTFyr3qU24lY=;
	b=F9kpLyKNj15vHJptCXTd4EawBJAtrDDd2pcHGh5Jg6xnlwRwaxScKI+bIPq4axAr0tRq4xauq7lvjiAyVpUD/MGPGdvRiq48qmDcLoXnr0p3slkM6YwzQJXl8yh/N5VOsRgnbpca418bJoBYiBTWjYlqFmxWsln222mqfimdv9W3tfs8rM72j4hZnShTK8RPp87lUkxHmqvjdmx1lW3dSLKRhnd7b98M+aqY282PVt1OZrRBa8QldgWRGCgJV/jdm8M4BgOSjINbaDunSdngcw57fkcnXlKq1shSLIZSFrASJeThrjU5kxI1SuKaxvaRjUpCd1jMcFxJuSO84BoGYQ==
Authentication-Results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4128.apcprd06.prod.outlook.com (2603:1096:400:22::9)
	by KL1PR06MB6473.apcprd06.prod.outlook.com (2603:1096:820:ef::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27;
	Fri, 27 Sep 2024 09:57:59 +0000
Received: from TYZPR06MB4128.apcprd06.prod.outlook.com
	([fe80::2bb1:c586:b61b:b920]) by
	TYZPR06MB4128.apcprd06.prod.outlook.com
	([fe80::2bb1:c586:b61b:b920%7]) with mapi id 15.20.8005.020;
	Fri, 27 Sep 2024 09:57:59 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, axboe@kernel.dk
Subject: [PATCH v1] drbd: Fix typos in the comment
Date: Fri, 27 Sep 2024 17:57:35 +0800
Message-Id: <20240927095735.228661-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
	(2603:1096:4:1f6::8) To TYZPR06MB4128.apcprd06.prod.outlook.com
	(2603:1096:400:22::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4128:EE_|KL1PR06MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0d9fc7-1f63-462b-8be1-08dcdedade30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IdxZTkeFAp/lAMriqDgNRQA+wdh/gZRcjKYxRxypCC6D1/zDyjDDtWDG0mTa?=
	=?us-ascii?Q?3kniTAqkKLC2GmNZTTv30vlF1F2XB5ZxMjrkevfQLAN0z5EfPBPFDkcNYff5?=
	=?us-ascii?Q?ixTMMWkvzJhubyDNCp0q+5IUAkNt1iv9tErMPOxBDTSFE3faBep1ZvlvM0EC?=
	=?us-ascii?Q?JwfUta28auYW/eQW60QFK1yqQBn/RtaEoLCnuoFEPNKjgF4DX7kw4YvkvzEF?=
	=?us-ascii?Q?sJtgkDeuLPiwB0mTZQR5TpfSdPLRsOQNzJSgHYq0jXKYPzm2H8AATwLXdAzg?=
	=?us-ascii?Q?sabY9CRT0WpwhiLyeIRL2EMNFFE6j1MleiK09Vr80bRSAsQp8Wfcxsa9gO+s?=
	=?us-ascii?Q?oyEV4uSnTaZJTKG6BmMnlnD5yxxrg88y9nxoXXlaZ+trGkldqgUH199jAcNn?=
	=?us-ascii?Q?b48f97EVhndD8PkMxM2bHlUA1dTH/UjI/4w0aMQpXroKwsLlBqiIRGBNBLOb?=
	=?us-ascii?Q?R1/MGSwaUBTbjZLPSxl0hmC5vVG9esKxYpsL+cV+T79MfOO/WNKUIL6kQoBU?=
	=?us-ascii?Q?3H+3lgkq+r/vgEUmCg08gh73I7t1+eDalUQiht1yLLljENGIv0yuVFhe5HDK?=
	=?us-ascii?Q?Jz62h8zp+GDfNDycMgE44DEC5xKO+BH4b3KwAdXNbybYYIe6zTrcr6nZg1h4?=
	=?us-ascii?Q?aScgfdNLZb7lJiEhpH3AnZugsSS+4bYUlCATtQXMmf71eUy1RLIfsH0QxNxJ?=
	=?us-ascii?Q?go2ywaHbTqga3NLT3SpxYBs/lRrVG1dWWDOg7aF9jdfwOMLdJJPHHv2iQguV?=
	=?us-ascii?Q?6ZgD+booP/JpGHnPmlYODVOk4N47oak2bAIoh6iTB7hxKcMl2otreGam0b1+?=
	=?us-ascii?Q?LncPpuYh3+DlfujaObOcCda3HvljNbtXKkFS0u/WBhD/SGMAHn/epPQBgNCG?=
	=?us-ascii?Q?xkcRrqDi2Xw3jqjtzcNYHMWw3HH0PukEJqtHPLDOmSVifO97EaYXsGJCndc8?=
	=?us-ascii?Q?cdTFKF0E3eM/0xfRioijDAEsKQbAyckJEKtxzLUFLMkcTa4YDh0HvdE40XNy?=
	=?us-ascii?Q?BBOohJLt6d/quvZFoZAO2z6Ekx3hiXWdtt/fWVKcO0RNTsafBsMlRjkKmPAD?=
	=?us-ascii?Q?03P4639GZHaZk88hDj0Qzs1LwXgdbQmKIZ736z9ww5o3qX3EFY/LUlG98Nvm?=
	=?us-ascii?Q?h5Nqpfz6bw3REBSnsYEz1dEusABnvxcVEyggg7Bg9RIAGGd/33ZO7BNN8ytC?=
	=?us-ascii?Q?G5COx861j4A1RHjumrg1GnJLr9wMFLnPJ2Rt2UtnUjsWT/07VGFojpbeKjjB?=
	=?us-ascii?Q?kJRR1HbfVoUh59tMP0FntJ7NdNgmfivWg6L/hH792QNdWQ5WwNs6ClGuak7/?=
	=?us-ascii?Q?xiRul7Gsc3QgIBL2g2IIDBfDj3pjrXmpNBGSBQ6WZxPyOBMW3rz9PNKpQMq5?=
	=?us-ascii?Q?GXo6PPm7qFf4SN4feloANuiroTqTpb3gF9O21xEgA3NvxFYkdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:TYZPR06MB4128.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OLvRzKe2NQg99Vzwd98M+t77ViU/xIUm+sTppZpl5fgsDTAqRus5Etg9copB?=
	=?us-ascii?Q?p5HPx9vQmkfbxf+hEiwx6E2xuqsyEX9OK9pQI2X8LJLeHG1g+9tlzfU3TgQb?=
	=?us-ascii?Q?mWaGkWzga/QelNKInSxYElz9MKt4fCQhv8mTUPm2uHgZkigKzlZdG+C3DAaV?=
	=?us-ascii?Q?G8R4w36ECB/PXmBbHCaBJZaemAnL7pLfMDBLnntfhXo0bNVWMRw5rRCkok8W?=
	=?us-ascii?Q?ddbQIYfzPWDPV86fVwE+EYB7ApzzpzjRiMT3ZyW7588/mVdFCAzQ2tAaa180?=
	=?us-ascii?Q?xOzoI/Ka4TvQAgwBsPzyBy6MjqvOZAL1W4t1xqFRFSKFt57SnZUMEYVTJ7+I?=
	=?us-ascii?Q?/P6c9J4rJjALZncBWYFPIqxaEw+PThNxESB6RjYAFBXVw5r9cM607qnlDpLL?=
	=?us-ascii?Q?pLD5/+vtOOwXH8QhsLkGpOnRZYek5SWEnu1X0lL7vAX/8V+l5FznbGOMcf8s?=
	=?us-ascii?Q?7H75GsKaiicHpiT0zNpTLBMbinjoVKjMtcjXriNp3GEybMzQpSOC4MV+ldMH?=
	=?us-ascii?Q?aXKGUj06iESE6bdneinoKlInhuS6/o5IRUqHsNXjf/iyCUl85xwt3POnKtrZ?=
	=?us-ascii?Q?wcU3Ceet4567P/ic7d6VKp+i0OJnS1UM0tQ8kw0qfFsdrJJhYs4Yzg3o4LVS?=
	=?us-ascii?Q?qeHhdxtcE1s3qpsUuysCJMjS4+Cr0WwWZX7b8E9yVhsO+UaLDsnVmDtZxLeY?=
	=?us-ascii?Q?Hj+DYcQhcDIjX/u+U4pkoTRx2/R7iqjPIZcQKd0zz5VMhMf3U9sY62yVONjT?=
	=?us-ascii?Q?5NtPy1v3Nxg1iRee4VQ/xJ0T6C+7mBxSnih4mFaMKYPYjjg6/mpqJdiSg5Im?=
	=?us-ascii?Q?zh8EzUC1ssPqfaVsqeuAUAFCUSIaoENIAh261rQOcts2FlAnJyKViXvebvky?=
	=?us-ascii?Q?XYP+7lhk18ZGb7ssM+003OPoaNPmiOD+bxlUapCGTnh8o+ofn4teQySYwgvb?=
	=?us-ascii?Q?nlaWo8w5kNN89bHkV9YeE7HNl28AwD3pNq2OWVm+DiXVBKvhu8zVizo/aLDs?=
	=?us-ascii?Q?UXTYJUl41wxZptlCMrHWOYMowtIWNsqu45guEVCR3g9368w3ewsbObHhKztY?=
	=?us-ascii?Q?GP9+JEgFq2HHvXWu8TXcMkPZi7JO+XcQkQ5Pxmg8GMQhE3/y9r985BHRDqVX?=
	=?us-ascii?Q?V9CePjen04oJ/H1/7zi+IPY7qkvJNmt6U6aMXOINYcxsJ7EIlGmIj3lm48RZ?=
	=?us-ascii?Q?6YbkxBUNY3936kvA6MFobnUdcdGheV9YIQJfGxSVx3rR6xU63Hj8DoOxBzN+?=
	=?us-ascii?Q?9LLKVCUAnKCb8QzTJFThL/V27TD5JHB3FIH9Zr6skvUG4NAXoLlRrM/Bharu?=
	=?us-ascii?Q?rMtRD2/Z4HyK8iwldHsvRBuGxuwAIpZd/YLREnODkcxp5xr9WTrpSBmfVaJl?=
	=?us-ascii?Q?Bv8mIXBI3Id/u5xhhV6Lp2KBMrh4G45TybVrxrzSmzYle5bQCjgJt4z3UNM9?=
	=?us-ascii?Q?/gVS1y/ynXGOWxIe1+t3HZEHisF36TR4dypZP6zDmQD2A8cIEF3ZCi/bICBR?=
	=?us-ascii?Q?r2UVV9O99jgb9Bc9ALm7WrdjWmgN8xhYePOEPlPVl5WuAtOQdXXTb/UwENPr?=
	=?us-ascii?Q?cerfxz/ILqNMimfRxq+pubMutxWOCGnBsyfYGJuD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0d9fc7-1f63-462b-8be1-08dcdedade30
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4128.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 09:57:59.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sLcUqPzSloZJ+bNoTwqoI+4Ejw4fWkzxitkElUQyrVsCjheZTk+KjOIIrKluwzQCuvABGj6DeF+d1WGmPoY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6473
X-Mailman-Approved-At: Mon, 30 Sep 2024 08:42:41 +0200
Cc: linux-block@vger.kernel.org, opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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

Correctly spelled comments make it easier for the reader to understand
the code.

Fix typos:
'mutliple' ==> 'multiple',
'droped' ==> 'dropped',
'Suprisingly' ==> 'Surprisingly',
'chage' ==> 'change',
'typicaly' ==> 'typically',
'progres' ==> 'progress',
'catched' ==> 'caught',
'protocoll' ==> 'protocol',
'stroage' ==> 'storage',
'independend' ==> 'independent'.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/block/drbd/drbd_debugfs.c | 2 +-
 drivers/block/drbd/drbd_nl.c      | 6 +++---
 drivers/block/drbd/drbd_req.c     | 8 ++++----
 drivers/block/drbd/drbd_vli.h     | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_debugfs.c
index 12460b584bcb..c116c4f93eea 100644
--- a/drivers/block/drbd/drbd_debugfs.c
+++ b/drivers/block/drbd/drbd_debugfs.c
@@ -622,7 +622,7 @@ void drbd_debugfs_connection_add(struct drbd_connection *connection)
 	struct dentry *conns_dir = connection->resource->debugfs_res_connections;
 	struct dentry *dentry;
 
-	/* Once we enable mutliple peers,
+	/* Once we enable multiple peers,
 	 * these connections will have descriptive names.
 	 * For now, it is just the one connection to the (only) "peer". */
 	dentry = debugfs_create_dir("peer", conns_dir);
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 5d65c9754d83..4b1876baf472 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -572,7 +572,7 @@ bool conn_try_outdate_peer(struct drbd_connection *connection)
 	spin_lock_irq(&resource->req_lock);
 	if (connection->cstate < C_WF_REPORT_PARAMS && !test_bit(STATE_SENT, &connection->flags)) {
 		if (connection->connect_cnt != connect_cnt)
-			/* In case the connection was established and droped
+			/* In case the connection was established and dropped
 			   while the fence-peer handler was running, ignore it */
 			drbd_info(connection, "Ignoring fence-peer exit code\n");
 		else
@@ -3918,7 +3918,7 @@ static int get_one_status(struct sk_buff *skb, struct netlink_callback *cb)
 
 		if (!device) {
 			/* This is a connection without a single volume.
-			 * Suprisingly enough, it may have a network
+			 * Surprisingly enough, it may have a network
 			 * configuration. */
 			struct drbd_connection *connection;
 
@@ -4852,7 +4852,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	int err = 0;
 
 	/* There is no need for taking notification_mutex here: it doesn't
-	   matter if the initial state events mix with later state chage
+	   matter if the initial state events mix with later state change
 	   events; we can always tell the events apart by the NOTIFY_EXISTS
 	   flag. */
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 380e6584a4ee..9ecdaac20e1f 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -85,7 +85,7 @@ void drbd_req_destroy(struct kref *kref)
 
 	/* If called from mod_rq_state (expected normal case) or
 	 * drbd_send_and_submit (the less likely normal path), this holds the
-	 * req_lock, and req->tl_requests will typicaly be on ->transfer_log,
+	 * req_lock, and req->tl_requests will typically be on ->transfer_log,
 	 * though it may be still empty (never added to the transfer log).
 	 *
 	 * If called from do_retry(), we do NOT hold the req_lock, but we are
@@ -1575,7 +1575,7 @@ void do_submit(struct work_struct *ws)
 		 * Be strictly non-blocking here,
 		 * we already have something to commit.
 		 *
-		 * Commit if we don't make any more progres.
+		 * Commit if we don't make any more progress.
 		 */
 
 		while (list_empty(&incoming)) {
@@ -1689,7 +1689,7 @@ static bool net_timeout_reached(struct drbd_request *net_req,
  * - the connection was established (resp. disk was attached)
  *   for longer than the timeout already.
  * Note that for 32bit jiffies and very stable connections/disks,
- * we may have a wrap around, which is catched by
+ * we may have a wrap around, which is caught by
  *   !time_in_range(now, last_..._jif, last_..._jif + timeout).
  *
  * Side effect: once per 32bit wrap-around interval, which means every
@@ -1745,7 +1745,7 @@ void request_timer_fn(struct timer_list *t)
 	 * but which is still waiting for an ACK. */
 	req_peer = connection->req_ack_pending;
 
-	/* if we don't have such request (e.g. protocoll A)
+	/* if we don't have such request (e.g. protocol A)
 	 * check the oldest requests which is still waiting on its epoch
 	 * closing barrier ack. */
 	if (!req_peer)
diff --git a/drivers/block/drbd/drbd_vli.h b/drivers/block/drbd/drbd_vli.h
index 941c511cc4da..aa78a55aa1af 100644
--- a/drivers/block/drbd/drbd_vli.h
+++ b/drivers/block/drbd/drbd_vli.h
@@ -15,7 +15,7 @@
 
 /*
  * At a granularity of 4KiB storage represented per bit,
- * and stroage sizes of several TiB,
+ * and storage sizes of several TiB,
  * and possibly small-bandwidth replication,
  * the bitmap transfer time can take much too long,
  * if transmitted in plain text.
@@ -179,7 +179,7 @@ static inline int __vli_encode_bits(u64 *out, const u64 in)
 
 #undef VLI_L_1_1
 
-/* code from here down is independend of actually used bit code */
+/* code from here down is independent of actually used bit code */
 
 /*
  * Code length is determined by some unique (e.g. unary) prefix.
-- 
2.34.1

