Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A32B298DC
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Aug 2025 07:22:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8D41162717;
	Mon, 18 Aug 2025 07:22:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3583 seconds by postgrey-1.31 at mail19;
	Wed, 13 Aug 2025 13:14:17 CEST
Received: from OS8PR02CU002.outbound.protection.outlook.com
	(mail-japanwestazon11012050.outbound.protection.outlook.com
	[40.107.75.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CF671608F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 13:14:16 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=myFiUIdFWF0p5k6EDlRy9HVWiHF2jWJkcn5cJa+N9yl+hQ3VaGpEDjsCPLHYz1KGXNBY9FPBl7vNKcHgfpO/MxPBEaa2jGaHcMyos5+8mKIRJrmxqUB6v5KiaKNKS0x7W2gcBSMXMtDPtk3ajnSxPs4i0egF4RM7yn3Yq04Y1ihNU/grhiLc6nGVnoCNOlvt5IKF2gLTldexBLkzuV0EUVrd7E1PS/O5Nih17TfLTNdeJyRncDHabE5GBmendIz1UfFKSVlzyfcsZbiWh+Bi0ZLw7ZqRMTdC667t4VjpqdWCS13ozX7Km0zs27h9p38tLgzj6ZAFSDqWPSa6cR313A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=k/uJKLvsWcEocoMAq5OY8WfQe2Awo4Jl8pqs2Qcgjrg=;
	b=Pl0nIbYoBHPuaKVK4HH7+Kw5A/PYPg/GIYC/DWn0L/Lp0fk1V6dtrOr0oHETdXBYAuA09Qi5Pl5+uAOIGTFRKbvc3SIp1EFH8URveyWGyBNKx6WOsSSwoCxzq/qjSycXZZ/jV5WIfmvVsSR/Bw/obJ8e6CXTST5M7TBSqTTeBHPD8WhgQoiBaj8pFKHjK/c5DWp0UtZ8UN0StnCo/vz1ccEygYLny9mI5AfN5ARPQDQRszBW8LuewVSzl/Sl2dzhvUPWDKN4q8ER1QaQYaCwPU8lTtzH15lYxFwkbzNu2EmCjQ/RhavhckVaaf+cN8gzc2Zd78Rm/cW/tU1I3yg3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
	dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k/uJKLvsWcEocoMAq5OY8WfQe2Awo4Jl8pqs2Qcgjrg=;
	b=VUXJIYS1kdsQdvh2+EH2omXGJrdDA+0KSaViS47X+jblKAEkt/tIJsQ1ahHNziuoXgkE7tzCmJ6y2NT8QIyie8bnPSVmydMOYNkvcTP7hMc6lSHjyF/VbMHjaPc+05uwaH0jv2kHCLvmyEhtx/Z61BXOA2ljxsZTh8dOmky2ClrNieq/bGtlOzZXUgs0ejmifGQyzixxfoxuHbN+wliA0xGFOrdmlCqveo8sK2E2NS0lYE5PtNFjbTNM9hHCbSoBx3C5P3NczFo8B2F53cPU26hgAQD6I6YZIdS4S8dCshKLn1zITKPNDne9dPwR7pWRml54cip/zpCvagLMEfcQIQ==
Authentication-Results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
	by TYZPR06MB4978.apcprd06.prod.outlook.com (2603:1096:400:1ce::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21;
	Wed, 13 Aug 2025 09:41:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
	([fe80::5c0a:2748:6a72:99b6]) by
	SEZPR06MB5576.apcprd06.prod.outlook.com
	([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014;
	Wed, 13 Aug 2025 09:41:37 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com (open list:DRBD DRIVER),
	linux-block@vger.kernel.org (open list:BLOCK LAYER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drbd: Remove redundant semicolons
Date: Wed, 13 Aug 2025 17:41:24 +0800
Message-Id: <20250813094124.553070-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
	(2603:1096:400:455::19) To SEZPR06MB5576.apcprd06.prod.outlook.com
	(2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: cb40c70f-645b-4ef2-a361-08ddda4d98e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JnrWYVncJyj9bFOKIMJykmiaZsMeX6nINDBfjNJvepAa7AJPpxnpn/ElZ36g?=
	=?us-ascii?Q?4RUpM3odQ7fJCFloEdYmN9ZnrDxKHvwbdcMYhYkTQ0LVNewmaneLnpy8+SsI?=
	=?us-ascii?Q?MY4RIDPwJsfcS/QzJmKx+Yzjh2yE8GqM/ge2i94Gvcdwn8c/N4zlJkkjViuj?=
	=?us-ascii?Q?4gry0nVdxhJX6PT80Y6g21wzzwZtP5Wmui69bwa4Z3EPYrxZ/DDD7O9GkD3+?=
	=?us-ascii?Q?EU/3KNbHIteXhspC/IRzKPrI5yi48BsAk4EQDg40mhel0X9Ld04RiyYfVFPu?=
	=?us-ascii?Q?iqvrmsreeUQL7gqil/RdSkOnMH8QxekAf2vAgXXCsIj7RaBdaV1/ZvxBF3vf?=
	=?us-ascii?Q?nofSy1x3pYEo8tjIDOYvtduZIiVuTVUMEyJ9a5wsvRhtlPtxNJAOXSl2VEMg?=
	=?us-ascii?Q?UbL5NwkHivMnUEnQA20mMeorbuEDaXOwgeo0JTFSz946lBydoffA4/XSyLa3?=
	=?us-ascii?Q?6o/1BUnxCvtpsfjlLEc5yjgr6VXrzGOrjjKcJ2cYgjGHt4Co9vhD3gZYWzLH?=
	=?us-ascii?Q?pE1RE8cM+JJWvLRKmnaP1LMPlJnzeUE8xzQWjSCYjGh+KfyzGBHmXfPI5pyY?=
	=?us-ascii?Q?9aehkpujBnYMOIQQblvaldZiBzm5uEI7LOykRAqmJo332+iJiXqmiXwTq789?=
	=?us-ascii?Q?qQUTM9VqIK+sLCcHM7jF1zfgoKRwoymP37hzJmCESxIF+hSgrAfCRmJpwkR2?=
	=?us-ascii?Q?9UwC43w3Dgm3/6fcDECJsGIw8XqzGVoYH1sLj1Tqp3dlAOa71Yx85sEoYvKE?=
	=?us-ascii?Q?wf162+H8J0XlYonb3L7G9/m3PbUxySkmeSV8fvB3FOb7pjvDDqJMz0eZ7M/M?=
	=?us-ascii?Q?cMoZVK8FtLghM8LF2pdslmSOX0aGsF0u1NM0ivrBLyCR+xg8xbKTSHiAcBpH?=
	=?us-ascii?Q?HyjIvA30fMcOkfK0ix8rU2vZD9abwyXG+WNxB6OJuJQJmhzWzfgnIwqyZpV7?=
	=?us-ascii?Q?0lT5irdkQMfINurMo+xVN7afNubR5ObJcb6S/EcS4DgG3Xrlo0Kb7Chqnlcv?=
	=?us-ascii?Q?S8H68GZ15QPSVtlzPVFAU73MOGAiD5gcJkq0IjSvsDZUO4XRRjMeljmhhjwY?=
	=?us-ascii?Q?kRWbOXxdcv76hO2q4PFgbF8pC3wF98IyMtnJKpuRHB7vK0SgvvNg8ySkv0qV?=
	=?us-ascii?Q?EVhUbHXY3k9SNIzdJTxlhEIanqB7HGCU3rwy7sS/PN2XX3c3C6t/WhIfEBzE?=
	=?us-ascii?Q?YajfRCQR2bcE5o9bZXBUiwkADGwrgcchORdQ/6RFZvHb5Cn3YMXE7H2ph3SD?=
	=?us-ascii?Q?WU3ql1Lqbeh742kOuPINX3eXW/sSAd/DlTgZY2D0kfvrAVj73HWbrLO68j53?=
	=?us-ascii?Q?t2pfHVoM5Kv1U1m2iQqgJxJoCrz+ZCO6wkHRr7nZvGi7HeT/x/gsoJgD1OSZ?=
	=?us-ascii?Q?yHakLBdYBFtYOK/MJpL4Hr6WexJJ9vcmqVCuiF71torXPYg7thqunwbBGwn+?=
	=?us-ascii?Q?FxSvfOs4RGNDJ8U7qOwNLcecuEwUu1cUf/FUZ8rVAcLJFNeIUdaJKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7S2+IB+CKjp+iM1/2BrInl1juUj9ObnTWmjxVGRv3kztGbdyimiIzdoyCAqY?=
	=?us-ascii?Q?+8Qbmft9HPxj5hg1qwt2kFKdoCqs9/aNOGqYgsxNkzmJdCrBGJy9TvMSV7Aj?=
	=?us-ascii?Q?wNsFmo+72rfV+brhpm2RBIDWObRbFqDed/775NM1oFo7GJjQ+ZiJpXCq8+Vc?=
	=?us-ascii?Q?EnIDaIle9fSmoymd+TSAR1VdnFcwufRMGE2aXDRXs+wqoNRqWQ5zf9LdqjrX?=
	=?us-ascii?Q?T6UQfZobtU12lF+aJnGHHklbGrMPw2cblSJ5SkUYa1qVV2NAWktitbW/7Fuv?=
	=?us-ascii?Q?TfwTHucczf/jaVha8QUSfvMvD1UuoxGEbdPbXdS8zPGob5GmYIPYCDSHOtv9?=
	=?us-ascii?Q?tv0bZiQDVfGzDCgMe6IQ1yBMG+Rltp0aVHtqHe+uoTRKHWro36J3truct7kR?=
	=?us-ascii?Q?8BZWEwKutIpj6VIg2drR1OucGcY4KmJQ4YknGWfq+lLKb3awY1PHwIGRpuXn?=
	=?us-ascii?Q?qaio/mEmLToSOceybuZ4KOiS+eTaUK49axWWx1kjmJp6SjFwFp1CQAV87v9W?=
	=?us-ascii?Q?ieU3ttjNXTAu9vtWcFjf/IxyXsnw0Ym3ZqM6Lcb5GLK4TmW7lg8z6n3h15Bj?=
	=?us-ascii?Q?8cThb4IL0THcxf3zDmg639zCvHqohUkdzASIN6x8OEars7eMvW84/MUcW+wQ?=
	=?us-ascii?Q?QbA2DmQKcjQtTEkA3J9CimJEyw+Mdfh8kr+U5T6XbE0a7jUVj/L2Gtf/Gbk4?=
	=?us-ascii?Q?6QRGrRm917TgDPh0sT3DmKe/+sECrU+ssdMXVhMHV9AfqPut39Nwm4lplfJJ?=
	=?us-ascii?Q?b4rZpXXDsx57BHuwh9AZL00U+L3XgARAdnmokzCKVSksgL82i3p7WgrE5Kna?=
	=?us-ascii?Q?dgZsoKcgItR3fKp1LtOAJig0bZGSV0B0GxADvSduXjsu5tNP7qINVawDdQVT?=
	=?us-ascii?Q?sRt5KO5RNolN6aCiP7iq1YXS7H/P2g65nvTUe4y9/5sOAffl9pHoLVg2QAak?=
	=?us-ascii?Q?LimPpPd2v4YPWuPP16SB8ntchqp8OHccdw2eo/8lEZot4XiYBquIacxfiJgg?=
	=?us-ascii?Q?BVszBVQVKJjmSf6UcfioLfNzBN8CZD5G24e6OBhsHd1mb0xsxcvcCj+YVJua?=
	=?us-ascii?Q?U0EQg8+EHBukMipXqnidHOKT6HNZiV6davMScorcj8wzGboKABLQF6kcnB2Y?=
	=?us-ascii?Q?s2Iulqi9d8fttHWNxDX5zjhxK0wmJZ6KSR7zcyoPM04KNGIUtfBHw/EpqkQQ?=
	=?us-ascii?Q?gCJqygeEoEBTNxm4xL5B6QUD4TGSl7YyEHo5ko0dNXdOoe0a9ruf/xmvSOdO?=
	=?us-ascii?Q?vAQ/EmkF3rLu2F1pctIMjJCB66+0AhBxiciDJFlNSC+a5jdA98VbW7qObVdy?=
	=?us-ascii?Q?wDz7pbWJMBb/GkTHuW/Z3D/VoHJ/MIEsirEPykaLGW0QyOpUURslRqN2/nmn?=
	=?us-ascii?Q?wSURp9/5GGJF6xMr2PnwdbLBZlhwwxeiOY3Ck+p4SD34+FGeo4JxhcAjXw5m?=
	=?us-ascii?Q?cLjTh3yFkDwLBSoJQMSc+YozbLfDjVO1CYfrw4/w2E5wm4Je1tufD3ccNO/a?=
	=?us-ascii?Q?rcv/NjT+aVYNikaYafyJ6S9bn6eclSaUaT8o56dfOtrtU8TX/YpEl2vP29PG?=
	=?us-ascii?Q?geprymvRG5Gh3V27k5DBg+/Mf5pYX4cGFttgjdoS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb40c70f-645b-4ef2-a361-08ddda4d98e3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:41:37.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCqJvRiltpvtBNEvv6rX842UwbeykMxEeHLNdJSDi1VTYQZ9BJOmuq7yH/mQ/1YEeEFiO0Gs/h9UoA95FrXxYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4978
X-Mailman-Approved-At: Mon, 18 Aug 2025 07:21:50 +0200
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
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

Remove unnecessary semicolons.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index c2b6c4d9729d..6616334d3813 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -2274,7 +2274,7 @@ conn_set_state(struct drbd_connection *connection, union drbd_state mask, union
 static enum drbd_state_rv
 _conn_rq_cond(struct drbd_connection *connection, union drbd_state mask, union drbd_state val)
 {
-	enum drbd_state_rv err, rv = SS_UNKNOWN_ERROR; /* continue waiting */;
+	enum drbd_state_rv err, rv = SS_UNKNOWN_ERROR; /* continue waiting */
 
 	if (test_and_clear_bit(CONN_WD_ST_CHG_OKAY, &connection->flags))
 		rv = SS_CW_SUCCESS;
-- 
2.34.1

