Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A74AFF01
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 22:12:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 89EF24205EC;
	Wed,  9 Feb 2022 22:12:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 11480 seconds by postgrey-1.31 at mail19;
	Wed, 09 Feb 2022 22:12:02 CET
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
	[205.220.165.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7D254205DD
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 22:12:01 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	219HIpeh017445; Wed, 9 Feb 2022 18:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : message-id : references : date : in-reply-to : content-type :
	mime-version; s=corp-2021-07-09;
	bh=8577t5BM+Q/ERWRQS5zJxK4WfyHyc1byyxuu4Z2A2rA=;
	b=OGJyaA9Dn+e/K9pHQMVOb1UHsxYGy3oTF+l1WW5as9RZPj3VIZaLbZjrerS30pR2kSLX
	5hU/oGAT9x1//0pU8doe7a4Dpp8nbRvH6jrtwWxgT0KxLDs5LjdbZng7iJLGtponNKBi
	6U6abQsTp6u0KPvRBBtgTuM7jndmE2cwY9is7m5as/P62Boe38KUzk5B3mRtksNXXyid
	xH3LvRvECopGsHJT8jk3eFSP2wwu7HfVQV6CniA2l1NpiQhxKhaHzBLNC+VLwdZyyWWF
	wEjbExhTBYtM9FM3/DspL9/r011zcxj966NiVdMPovGy0Llyh/3k0p+ceJV4H49Tenyx
	Hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28na86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Feb 2022 18:00:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 219HaRk3167489;
	Wed, 9 Feb 2022 18:00:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
	(mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by aserp3030.oracle.com with ESMTP id 3e1f9hs6bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Feb 2022 18:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VT7gkoo4jMK4BC636+ynINNfNcn1d1THYlxqrSeSTU98F1BN1VgYh6hsoGhRpDLdJcsBU539TGF76EbTF8YKfxur1z20y0rsGwEgNIkh+XSFC3jvj8p6X9+4ZFcf3+emGQlXBhQ7hdELkY2W9p3Iw9Br8HaHxQnD59HRZDg3467e9F+IZtaFu1pz03hprXCY9yAN2HL5T5djDduKxy9tDZ+aiz++7Tg4VU9fpSSDrd5pjoKmNOBO0mThybv131fMJg4cmeN53PkH0+ijY4IbMKl2XKdaL94BbFiAgDveFv+0i5a90IEjPzOznfoS1moWTWQNbAqH4GJKrX+lmLGOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=8577t5BM+Q/ERWRQS5zJxK4WfyHyc1byyxuu4Z2A2rA=;
	b=cAkqPk1+QKaUoMfW9syEVYsItdPwXXrh7Bp1kgAlpr3mUHQ+5V7rgfv7ZsuchAvRTv4y9sMiUQqPb5TY7Cp0zldRCdaXPdmpb29KsoAFyspaOWk8okoGXqGz0oFjDccC7cstrwFHTHP4n82ZdaebCGj0tRwfVxDQ6S0q2/6dHhpmGVwreGFLC3DB7Haf3tjSazh/m/pta29ZTVzoJY08V9N+GI8OgsLmyxelRkSPODQfIDfj3BH7asXcjyYZCwNMsyQPIXyBFLs2Ybwc6wVgSP72TZjrH4fCskIAKAQ+wgiRd98UjDVi7MdBJUTmottxPdruFRNe6e5h40j3wilStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8577t5BM+Q/ERWRQS5zJxK4WfyHyc1byyxuu4Z2A2rA=;
	b=CFV/0qRhWxJ/lvpYFBki/pcL6ixY/XIfoiNhr1zO8UhYZVwWg3aGO6GemgWj0Xp7sBS+B3m2Cb437k+8bBHd3JgD0awfq1XsyNzgrWSkhQKcdxI7HSb3ogvcJCz621dKu4odtQRBuY0khjuEtbCK1Cx+l7c3zrGAf8Dl1yMyZxI=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
	by BN8PR10MB3489.namprd10.prod.outlook.com (2603:10b6:408:b0::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11;
	Wed, 9 Feb 2022 18:00:29 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::2d45:d1bd:ebb9:48d1]) by
	PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::2d45:d1bd:ebb9:48d1%4]) with mapi id 15.20.4951.019;
	Wed, 9 Feb 2022 18:00:28 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1wni3sz4k.fsf@ca-mkp.ca.oracle.com>
References: <20220209082828.2629273-1-hch@lst.de>
Date: Wed, 09 Feb 2022 13:00:26 -0500
In-Reply-To: <20220209082828.2629273-1-hch@lst.de> (Christoph Hellwig's
	message of "Wed, 9 Feb 2022 09:28:21 +0100")
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
	(2603:10b6:a03:74::48) To PH0PR10MB4759.namprd10.prod.outlook.com
	(2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33eadc43-ed54-4510-144c-08d9ebf60e56
X-MS-TrafficTypeDiagnostic: BN8PR10MB3489:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3489D3EA5A0539796B959C938E2E9@BN8PR10MB3489.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53NeUEqzGzguB/mKdF21IbQfNjetWcow5zmdhi0ab56L0eC1gb33bNS2UQUso2mnN5ARJZjfB+UyBqndTFOXLFx7qG+QmKrl+0NDNehQOAQnq2ba1SfR7EPOb6rF5TETmeTz3K4VYu4sA4G4toRkEojRIMhci9za0oE/AQc/kLs++LwuDGJ0zkH6/XPijmEXYgYCKXdT5/4WvStPb+2cRixJ4eHy74QxqE+dHGpbUyzd71TPcaeP5o3leT8M5ADem+phuJ7pI6rFJW7pBRLNviUzdwUmiI6A9r8oIe+OPrijnIVkrrK3dr8HGeQRUd7oPOfqA/jgffwCubk1lLAg8LdXPyv8AfyJ3D+La0YdTn3mFofrx340vGG4uJGA61S9sntXuzkhFebypYUNVL+xb1DYiBCjwBEzxmmPmLoCah2taH8Rizlj810HD+ZqUEl+n5vK2Fq7L/hxAZLDJ4NoY/Z8vXUEhoiRhZmx+4l2NmhLuf5D7N83oApXcT7Xfd+rsh/65TWKFxoNps5jGzFcp5UDR3WJCN5fzunnmgYu0M75Jf8QOAPTFhS72L7RXtZDWAEtS+5rV2ogvUdvGaqRyfBiz3ltm4ZtvvOyzy8LT1lBQvZ6xDan32PmaLLoSo5vF7k4vFPHgEPL7EmPdBJMLYd8defDtFDoUYe0VC9It8bPvSA86XL/e6UhbW7UaivnFNSzomCh2WJmwk2doQqEtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(366004)(4326008)(66476007)(66556008)(8676002)(6486002)(6512007)(508600001)(66946007)(316002)(6916009)(7416002)(4744005)(6506007)(2906002)(36916002)(186003)(52116002)(83380400001)(26005)(38350700002)(38100700002)(86362001)(8936002)(5660300002)(7116003);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iQ6l8k4S4HT0p8JtUY6mAKFPV37M5art+dpLclzCD+AI2ZzxiFAtehGAEr+q?=
	=?us-ascii?Q?wIZZsYqRt+T1np8TdxUTIbmHWwKzmG/CdIrAUlcCVGyMib4NjTXbx7Q/23iX?=
	=?us-ascii?Q?OBmEBa+5dowV2tSZbBTQbRo+vSMQcAH7CbCQv7Nk+NON4Kiy594lp07s2MUu?=
	=?us-ascii?Q?2k+j8hWlmSCi07CLwN0XatlkE6oqWtIFUeJQGmYPmn7guEDAcBU+kg/7Ul8P?=
	=?us-ascii?Q?6ID35Li4rOjSg/kPXaCxvDhQXdy2ZYtlqBBd1o8gu5lhEMK5lemnYf4rVZhy?=
	=?us-ascii?Q?d3odjbxF4KH64z0Nkja+KfURTDYYg8/PFX3A9X3VtxpVtqARbxgWoTSY1rg3?=
	=?us-ascii?Q?WutO6I69jjM+uvGOBuyfCTmuEQQVg/Mw+glMruH87Mc2bOEuq1GMQejWJSqI?=
	=?us-ascii?Q?gkkOWGCc70l39A2NfH2OOU+UnfNWOTlT9NREFZagUcp6q1hcL11SVQ57Ctmp?=
	=?us-ascii?Q?CC+ZnBYSB3+7e4oWZ7YWToRitT8A79EuxB9hffZs1RXRmnZYj3zkRVKwvCKg?=
	=?us-ascii?Q?pTkWjJMfgDQV18W/lkXv46oebDHQG68FnPtJV0u4FbWYogfpUztsOMoY2Zf9?=
	=?us-ascii?Q?Fpmun8buoOhynn1g7MYvUOmWbC4JSFFRObz3va6R+Tl8Nf10DtEzJhJb47oX?=
	=?us-ascii?Q?lnyjtVNK4/mJELkQC0F3v7kDVZmNn2pv4PC5B/znnCEigmcOgHLjQVyz24cf?=
	=?us-ascii?Q?7WzZ+JtSN3BRY9FjZo9HRdoD408VzFMn1duh281oMSFeYoY7en/Yulu3UXvq?=
	=?us-ascii?Q?8Gwh53rfoFh3+i3o1ftHikKzPFdqselPIPG1G5Y+o+CB8DVAlU9PwMZYl18D?=
	=?us-ascii?Q?Dlz8GPAXyAROlXT2VwSPEr4ufD/5pfWTNMR9wS6Bmoau5xLIpCt+lGZGDFoB?=
	=?us-ascii?Q?DNGxONZTZlgArufsi9dznzJfcRHzoIOwkP1ihUzVS78aXAaLzV8gLRUJy8qN?=
	=?us-ascii?Q?m1lIrSjFfmPR8iCoXhb76AsQ2iVnci8JZi+RUlVvQBnFln4KNk0WZcKjwPlu?=
	=?us-ascii?Q?b02oXYGeWyev9CuQJ0VMncvX46pf5ZzuQMKHXkQsftOsoo+J6ZkGBNo5eSEP?=
	=?us-ascii?Q?MK3iJMuUma0eJQ4VHRqhdjU7HD9KbcaHHhm2YQtTSQ9+OHhLBhZqBQv3VDK3?=
	=?us-ascii?Q?ey5fkWq9X2Vp8S2fb/KlNJVBfuiyFCvyhS7nNeKZ+8aP9KHLQ/q26pjEIEvQ?=
	=?us-ascii?Q?ss26QpBbH0vH12mYW9IibglEM0VDSqSLh+xdpBgD3xAFRhc2YD8ajlA81Rts?=
	=?us-ascii?Q?VdywWdd2559N8eMRlyU34A8dZ8LUOe+TUBel+Q1yhW3M8V0jatmnJFjQZvXf?=
	=?us-ascii?Q?kS3XEVrty/AE1AJ4Bc+VIrGbmiWk+z6SO7mC5Zlg7YuWRvePXabSqr2DjjeF?=
	=?us-ascii?Q?V57hx0txpoBfqy8ffS2xiY5uDhXZpI8RPFf1iaNYIRzlt+R9LOfscrnYFgeq?=
	=?us-ascii?Q?igylHzGcQmlEpMkqQwzzQzub3ZX19Q4STlvBZaocMPF7qbyf/pAKwaUG6MKw?=
	=?us-ascii?Q?CCAfcfhSCrUsbgU6KOy24TUZv1Q84PC3XDx+TJPSd6Xxyy8Hkbj8QWLm8A0n?=
	=?us-ascii?Q?h9XBQS273WZWIp7pTrQMamR09wwVFsBnEpZytOU6oPTOcE9fkc4KA60CTMG9?=
	=?us-ascii?Q?LO2WORpL3Fxy/B+BCREZwmfemu8iv8ILvwFZgO3SX9vNgpBhS1UaH+PZu3pF?=
	=?us-ascii?Q?3JyaVw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eadc43-ed54-4510-144c-08d9ebf60e56
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:00:28.5746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3cL/X2aVKFNPpD/uqEfMTZdT+sOhX5Dfiwzl5MGZPyPoZgFYZ9PYvLXzWSrriG0pw0WF2vLXF+WETA9fAb4gmhMApjpAEp5ODPcSOTZARE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3489
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10252
	signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	spamscore=0 adultscore=0
	mlxlogscore=410 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2202090096
X-Proofpoint-ORIG-GUID: w4BwM9kTTxHYMQjzsq7CQYaX9qCI7hme
X-Proofpoint-GUID: w4BwM9kTTxHYMQjzsq7CQYaX9qCI7hme
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, jinpu.wang@ionos.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] remove REQ_OP_WRITE_SAME v2
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


Christoph,

> Now that we are using REQ_OP_WRITE_ZEROES for all zeroing needs in the
> kernel there is very little use left for REQ_OP_WRITE_SAME.  We only
> have two callers left, and both just export optional protocol features
> to remote systems: DRBD and the target code.

No particular objections from me. I had a half-baked series to do the
same thing.

One thing I would like is to either pull this series through SCSI or do
the block pieces in a post merge branch because I'm about to post my
discard/zeroing rework and that's going to clash with your changes.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
