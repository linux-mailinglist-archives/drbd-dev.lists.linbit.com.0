Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B14C0782
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Feb 2022 03:00:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CD87421783;
	Wed, 23 Feb 2022 03:00:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4144042034B
	for <drbd-dev@lists.linbit.com>; Wed, 23 Feb 2022 03:00:09 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	21MN3nd9021790; Wed, 23 Feb 2022 01:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : message-id : references : date : in-reply-to : content-type :
	mime-version; s=corp-2021-07-09;
	bh=uCd3DcJ8Ec70gGmtbkgjtiKOKlVdOn2kYUwOasUDKvE=;
	b=WH6sgurFf4TASckjKI/UJFCfmvIOVyKNqy3K06Da41oZr0YcZ74Ne53jjOCv4D0Zmn90
	fDY7Lbsv7qhtVVGe6xkqHyybS0EJ+qUAmhFXb0z7pHxnlNuw6LEw3WTxC5/7Jy98XKEF
	nNyqArkztI7rIoreWXdMl1pUjkl2VvoypuCCGpMGmkl6ZGf0O/zkXAFUYwPyvDlQ0qYl
	r4WSAaXC4mqyRXoxCbXwoXA5PzfTC5h9jVukFwk6B+kLaKsehs+MCyIDX52WnZ/2P/L6
	y5ri+WJwXJCrDAgy5Yt0Q5ehZpxAM4rWJonnFdWTNDpQwPKD5Td/N6fwvbsLaAjsYomP
	hQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar2gnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Feb 2022 01:59:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21N1oga8169951;
	Wed, 23 Feb 2022 01:59:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by userp3020.oracle.com with ESMTP id 3eat0nsw8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Feb 2022 01:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KQFevz2lhLTbx+SxGlsX9oI7afT3i9I05BxH7qjlmsG+0RfEPutciaHNf0lJELXFryFr+t02cG1KNYjP4Zb4k4slpqUOUEN9fEM5BfUL70vnglnaie5TY9/NmY6ntYg4oUGVxS1TMwFP49fTJcduVwYCCuzide6nKUGgGdNkbJMk8BqzfhTY3hDfduytXJpiAn+9yJDASuleBKet1gYLq7AIVBT3YY0XWHl9DZaqnLusqALXyTk5OWQ8/r+DikVdHFOIcyAEwIe6RwFDxrY1aG9+P/x+3/0eJo0KdTXT+WSHTjkm1aeTl0BQBrAubqoSfMiCcmi8t/1p+4rbBMXlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=uCd3DcJ8Ec70gGmtbkgjtiKOKlVdOn2kYUwOasUDKvE=;
	b=COCNhZ3v3bcZuVRCBVIa0d58eKeWG9QbegttZrlncRs/5pGy+ZQrMDp3ut/j2Mih8KQIBJ0LCET+Wb2O6uT5l3U0+uvhRyOezMWKxpSh7AO2M6mc015J8FQ9lYfPOfioy2/awExuxcba9cptid5UT6VmRgdfZ5iVyzv5XK/frEou969pEOKK9avtAzuh60LxAoA+Vfm/Kq9o4msoYbCxFqNBQonqDmcQvuaysUVYmez0lM4vqfPlRf4XwTLshTISuA0fbi5r+MpCq/xPPJe/41yc0ACcojPAd4ZrRNxGgwe7iGYGzzysFRusftJin3nu9GxL6nQssbSWGGms4gweGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
	dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uCd3DcJ8Ec70gGmtbkgjtiKOKlVdOn2kYUwOasUDKvE=;
	b=rGNP65u1i3yw9tDXct3lxMRXZbt1pNnI+qoWa00cos8o3ur0zi28H03w28tDD7M4oYmazMVLY2cPcTznoGgVy/SlypKs/PjGaFYxvmV98YyEjH5Z9Z4BWk7iaSf11uAsMqkBN81zzAzlVrHWdGg9y1c/Jv16nAXSGwX/7ArGFt0=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
	by CH2PR10MB4293.namprd10.prod.outlook.com (2603:10b6:610:7f::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16;
	Wed, 23 Feb 2022 01:58:58 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593]) by
	PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593%5]) with mapi id 15.20.4995.027;
	Wed, 23 Feb 2022 01:58:58 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1k0dmcpih.fsf@ca-mkp.ca.oracle.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-8-hch@lst.de>
	<yq135kefh5j.fsf@ca-mkp.ca.oracle.com> <20220222073833.GA4979@lst.de>
Date: Tue, 22 Feb 2022 20:58:56 -0500
In-Reply-To: <20220222073833.GA4979@lst.de> (Christoph Hellwig's message of
	"Tue, 22 Feb 2022 08:38:33 +0100")
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
	(2603:10b6:a03:39a::28) To PH0PR10MB4759.namprd10.prod.outlook.com
	(2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beb76ff-17dc-4243-fbfa-08d9f6700e09
X-MS-TrafficTypeDiagnostic: CH2PR10MB4293:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB429368F3A1F30E4D0EA34AC58E3C9@CH2PR10MB4293.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TppeV1sN9wjmXJ7qvPfnTsRqSmZjjwupYjef+tA420Y4oyflZSsYfCCfjJ1Cj5zZiZMM8W2wkSljU8TtxiyDhhTn42iAPNXzW6GkjUSm8uCGTrQhcloF15r4nUpcRZ4W08CJG3gIS9UyBXNToXZRAsHt3IO5aSfM11JH0hCAqnK14HHGXK97Tnb/aeLjBaduSK7P3/Do4CeSWmFSPYV/GcvIyFBDwIT2oYe9zDuOUcX4Paq0RWv+pBmLJNhLzhBPZERyMSV2HBAwV8K10uudr9acu2YfsLo+2yK2ZnvEkmLLFh8tS/9xmVXX/B8apzL1Ja4J6BTLg6neSkITBZKpDSlcK4VVSntoCr72XLVgWf9mdSos0jkE6K1vBeR2w9W76gXpUZ6Ze7b2TXlePcDOKfjSPHrtXYH4xZuu/TZ5h2ZziXBKcyDJ3+bM8oFwFYjRUSeEqSyK0hvcs2XAtPVoHG3RtqH0vgs/7jYMqhPpzHM1C1AxkVbj1rk17zQj+fkOIdg5p+MjwGmQAQKf7ovZQoGQ0DqQpv0HvFv9cG5eGfJfYEhBO04DGJqy6y9iPDtuuVlLDlmi+Ef2FWzG3JpP0umJLlzl+Jl0Aq4jM+iJmiyfGLhVc1ezRyktyjDS+tSoeP+IwyXyepBMcAmqT+8eFlq353Se7Ua1hcyweEZfSsPn6gINf+vC96+FJscySMrfI9Z/EvGoyjHo+qXMswJ2iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(366004)(38350700002)(38100700002)(8936002)(316002)(5660300002)(7416002)(86362001)(6486002)(508600001)(6916009)(6512007)(8676002)(6506007)(36916002)(52116002)(4326008)(2906002)(26005)(66476007)(558084003)(186003)(66556008)(66946007);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzcXutVrChIU8JlfONbQAlXn3ZRa2CBvckDLsW1vQv91wLjtSSotHf2ew+6z?=
	=?us-ascii?Q?kIDoYkTihjunRoFO5X3xwpkEVh2y4qAaaLuVIXyuJwEQCm92oIF/OaOCcK2w?=
	=?us-ascii?Q?rPXqi5Qb1YlzouWP9dz3y9pwcQaySPf/eBX4RHPtqdL4x+y+NE0aVdft62tk?=
	=?us-ascii?Q?LM5fJHSq2fqwHZ4S4JzIWXLVZfsvYEwYspNXgMVcZ88d9YhaAxTVEoE/jCWR?=
	=?us-ascii?Q?x4zajtmdecGeA4WqekeKiV9TqHhSkndjNCq0NREBK5cnLpoRwPD1k68RcRck?=
	=?us-ascii?Q?P3WYwtHVTZMHdMT0LjW00gGnT1ZqP1juVMU3RPW2WIi2qzP6ZPzPwIiVL1WT?=
	=?us-ascii?Q?987nEQ2fiUFAoUAPjzG0KE01FXZ5CBXa3OLJ+eywj+1hCVyzM2xBYF55HUUt?=
	=?us-ascii?Q?j+fkS1/UmNFBatf4dS/Q2CZkFdjfZeqQpdlFmUuED4oYHqysNSclAV11h+V6?=
	=?us-ascii?Q?LBaKYjGoPLJ3udGkryDz58DvOifzM9LdRuZVoSlQK1WnAgsTii9l6N+XTxU3?=
	=?us-ascii?Q?8PiXfcZqXRqqug4oBlrZGM/51GaYikPXiWAoXx5iApKXdxjLDE0wg24lNL9Y?=
	=?us-ascii?Q?SS7eKPggrsfPYpFZwz3BM4yp8hnXQgqa66xq419UOVnwMSkjZ75aZYERjCkQ?=
	=?us-ascii?Q?AB3WlVFCRzzZVC3muvYkVmb9UM0CTzZNtKUlK12gA7Pl/bzzXXV5HrK6dfYo?=
	=?us-ascii?Q?3coBvGKOVNFC8h/UFRhfTQSFbU1ktHIdPZl/UP4IRh1TR+ZqadVhtE7nmfG6?=
	=?us-ascii?Q?KqV6jFvzgWu73+7P91thmNZjFdHrqO4cTHV6Zik7egsRHggmwpodBUx7RkcU?=
	=?us-ascii?Q?icBk+VWUP7mfgXtzQ20IXZf+aKlOCqLCmUUPbF2MBbp7oiCBQX7GXJLOwFGf?=
	=?us-ascii?Q?01kv2lAg1j21L2pDabbX9mmmQuhkMWBKXHAT2JKN2NtxnFChNJMiQFA1W03b?=
	=?us-ascii?Q?p3Lx1gn9Q9aa4/f1/rAWLwws5eCN53UpecUUmK5I0XJPc+VpMeoH4V27HeEl?=
	=?us-ascii?Q?9dleqMI8yMa2ZJ8rOum4f3MupgK0KUmKMhsuIwu1GMyAgkoBrwCRdBX7VhMC?=
	=?us-ascii?Q?hbmvuTUotJx61ufTAvmNKE6zenpoTJCQ1dJ7QcsaH9a+t/ehLL4byD+Ms8Xq?=
	=?us-ascii?Q?G87CkdI15zrlLN3lWdfpQ2puyaoQa/No1dzCm2kCKD5saXVIfILWWx4iQk5L?=
	=?us-ascii?Q?7s188pKTcUjsvli/OC3eICrNnXX9gqNs9XkWru8XOMlvf8VyUBqRxQ5nA64Y?=
	=?us-ascii?Q?9tReopAvgmcynbfWQAxXDRfnQxWokX2JmeO2R1tRzLfEa69YQyHPNIPfn5R8?=
	=?us-ascii?Q?gKUBgKzPltRKqkyOtlJRXX73IN5N6fdbi+cel1iK1zC1iIAGaH8bXf1lz5kO?=
	=?us-ascii?Q?ttxczdFDg+bFXB5umYE21jMEV/93iH0xM8TgWXyyNIrqQjy04c1wCz2rOU9F?=
	=?us-ascii?Q?sdhj4j7Gbrf11kY16/zRJ6JveOUUbtNL3imCQDkKJuJ57r3mnT3fXGa33LOl?=
	=?us-ascii?Q?2Bz4LpqNOrQC42u5U2gL1UGGkI2Y6PD5N59a4Ib5m6hrYWql7CWzX8MO7CTM?=
	=?us-ascii?Q?tPmULmX3Pxy4ntNlb1XK9MyPN/c+Bq105Hb758JBFP8I2mp1iswzThJKbpzH?=
	=?us-ascii?Q?Q34tIj61AQ5h09OmEmYhL0UiqLWYAxnLDuJTl4lujR6RNqGMLRtVffgPQ+f6?=
	=?us-ascii?Q?XyL49g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beb76ff-17dc-4243-fbfa-08d9f6700e09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:58:58.3347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzG6L0tLUpJhdpPkLufrsNljkeyzbNASMk4xSt4NOP5UJrp3q29SnoKXEjxPn2H6m+MvNUi7HCpuSXpKAKeNvcANSkpWHnZ1v2FV1xq3cJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4293
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10266
	signatures=677939
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	bulkscore=0 spamscore=0
	mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2202230007
X-Proofpoint-GUID: erlMEIfg0EtElSGE8Fyd_nVZoy7bJHYe
X-Proofpoint-ORIG-GUID: erlMEIfg0EtElSGE8Fyd_nVZoy7bJHYe
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	philipp.reisner@linbit.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, ukrishn@linux.ibm.com,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com,
	jinpu.wang@ionos.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] [PATCH 7/7] block: remove REQ_OP_WRITE_SAME support
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

> The maybe fold this in?

Done, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
