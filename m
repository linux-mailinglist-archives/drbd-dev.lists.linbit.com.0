Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628CBC4C2
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Sep 2019 11:24:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 132A34203C2;
	Tue, 24 Sep 2019 11:24:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3556 seconds by postgrey-1.31 at mail19;
	Tue, 24 Sep 2019 11:24:28 CEST
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 776634200BE
	for <drbd-dev@lists.linbit.com>; Tue, 24 Sep 2019 11:24:28 +0200 (CEST)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP
	FOR drbd-dev@lists.linbit.com; Tue, 24 Sep 2019 09:23:49 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 24 Sep 2019 07:37:38 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 24 Sep 2019 07:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oKDtTdOzG6Q+p6pA0Xl53wLBKIFQ8pVAwXdawgMF6yhnZ8izvhSi4VLYCpw30j/DGJdzNsEEP7Xes9dcRuYlyZEyUxDOtgx3t3To7F0YMH9zxfoBBCoWs94MpOnD+wHSkdTEJR9eIn6v8RNk7LjPZmsnWNg9TaLAxz85seHLQAJeowXglzV9Mqa2ntfYbo6kmQ8oYYEEevI2j6nVYkkIE/q0C07z78NG4K2B2UzYZhzH9a7XeYdB1LqJv20QlCE3k6Axx3pG0hfJzVr8NgtOfvpj8dtJtJdCgCS/jY3NGZfekvORRej9eloKiHKPrjpL6Ii2avR9PORbzNlo2THgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7d9gmfwNCjax8/EeZM3ZWMmDGv/PW4Z2+qLdzu9NOJE=;
	b=OsK64KdIwBBchn+fl8X85Ief71Q3tF07atr8Z/s4G5+2zSB4J+As6s6bY/SE6O5/Ic6Z56vDaqwmARDe/2u7d66kjyaQcm5CWEQh2dvViqZfy72CAJbuD/5ID5IDKWE/zCREx6XV9QKvylIRwptkGeLR5Fz93vqN/PMoWhctJP+vEIPKHOB0gLs43iK/l0v6+Jm2uWx5ZQVQ6Izjnb4/OXzuTdI+1M1faIqmSotDHMM3vc/rmQ5UhfxZJxgBRfuod5tT1y3OykPqTTQg6l+g+Ao90zp8Q+NOEFOu/lB54Yn632bL2fxSnCigk/LPIJxjTtUP606yAtHTpAGsA7QEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3370.namprd18.prod.outlook.com (10.255.174.147) by
	DM6PR18MB2619.namprd18.prod.outlook.com (20.179.106.206) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.19; Tue, 24 Sep 2019 07:37:37 +0000
Received: from DM6PR18MB3370.namprd18.prod.outlook.com
	([fe80::15c2:9292:51b1:b848]) by
	DM6PR18MB3370.namprd18.prod.outlook.com
	([fe80::15c2:9292:51b1:b848%7]) with mapi id 15.20.2284.023;
	Tue, 24 Sep 2019 07:37:37 +0000
From: Nick Wang <NWang@suse.com>
To: "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Thread-Topic: [PATCH] pacemaker: fix the outdate return value of updating cib
Thread-Index: AQHVcqrv/L3VTq6P6ki6HFVGHEvYMQ==
Date: Tue, 24 Sep 2019 07:37:37 +0000
Message-ID: <20190924073719.9240-1-nwang@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR06CA0211.apcprd06.prod.outlook.com
	(2603:1096:4:68::19) To DM6PR18MB3370.namprd18.prod.outlook.com
	(2603:10b6:5:1cb::19)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=NWang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.16.4
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 687b7906-3d73-42f9-8dce-08d740c21214
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:DM6PR18MB2619; 
x-ms-traffictypediagnostic: DM6PR18MB2619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR18MB2619EEEEED44D92061F4D5E7D4840@DM6PR18MB2619.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(476003)(14444005)(80792005)(2501003)(71200400001)(186003)(4326008)(256004)(2351001)(386003)(6436002)(8936002)(2906002)(66446008)(66476007)(6506007)(64756008)(66556008)(66946007)(107886003)(8676002)(6916009)(316002)(81166006)(81156014)(66066001)(5640700003)(99286004)(71190400001)(6512007)(26005)(478600001)(50226002)(52116002)(3846002)(14454004)(36756003)(54906003)(25786009)(4744005)(86362001)(486006)(102836004)(6116002)(2616005)(5660300002)(7736002)(6486002)(1076003)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2619;
	H:DM6PR18MB3370.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8UOeZHhSaDMR/n1xpwOAbb5sEtnFSTNeRpVV7Fdb/vfKMed7dBDCt7oQ4+Gc5DnnLdZN8gHUj6VZVaW/+lq27SqA3joz0kyU5KyStYB9kED1K2DDOFk1URwyS9rX2G4kA0cPfoEDUOZv7+o4A592nzufczuRZcji7bzV+GUonO1doouoAA6hU5HqqAWf/BUn43eJvYNzyt2a85BTg9STrD97aBSvXqDAOrigHxVGlkfx7LMwbldyLZEmd42oTTuBLpUyCazXGJcYZSbaoH3sFwb+XTMi3YVXwt8vLslBBD+OkG4DT2ziYHTbnji97+pCYNbJ/oNdULbk+sAFd90eFXr38c1txjqAhLN1hv03xUdgEREY7lGhs7tgvo5KInB4q/JGf2a/0Ohw42ld+mSadaW4j2Y6TfdOhVY4odpSxEM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 687b7906-3d73-42f9-8dce-08d740c21214
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:37:37.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAfxUWbi6DbjpS2G2Io/clQmB19hXf0osb90UX0mIa/1rh8FYW7IxJ+YFON4kSfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2619
X-OriginatorOrg: suse.com
Cc: "lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	Nick Wang <NWang@suse.com>
Subject: [Drbd-dev] [PATCH] pacemaker: fix the outdate return value of
	updating cib
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

pcmk_err_old_data(205) is internal return value for error
"Update was older than existing configuration" of cibadmin.
CRM will return CRM_EX_OLD(103) to fence-peer instead.

Refer to "lib/common/results.c" of pacemaker for the value.

Signed-off-by: Nick Wang <nwang@suse.com>
---
 scripts/crm-fence-peer.9.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/crm-fence-peer.9.sh b/scripts/crm-fence-peer.9.sh
index 0417c7aa..a4522a2a 100755
--- a/scripts/crm-fence-peer.9.sh
+++ b/scripts/crm-fence-peer.9.sh
@@ -146,7 +146,7 @@ create_or_modify_constraint()
 			break
 			;;
 
-		205)	: "205 aka pcmk_err_old_data ==> going to retry in a bit"
+		103)	: "103 CRM_EX_OLD, aka 205 pcmk_err_old_data ==> going to retry in a bit"
 			(( $SECONDS >= $timeout )) && break
 			sleep 1
 			continue
-- 
2.16.4

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
