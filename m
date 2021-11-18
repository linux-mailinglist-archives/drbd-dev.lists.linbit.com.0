Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C44589B3
	for <lists+drbd-dev@lfdr.de>; Mon, 22 Nov 2021 08:14:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 302BD4204B2;
	Mon, 22 Nov 2021 08:14:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB8A6420952
	for <drbd-dev@lists.linbit.com>; Thu, 18 Nov 2021 16:24:12 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1AI7teEE020982; Thu, 18 Nov 2021 08:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : content-type : mime-version; s=corp-2021-07-09;
	bh=CxGDXlmpz2pQo5ev5RK2zfe6yB8VtYWiBcRAyhKZBTw=;
	b=xOdM1+1jGeVsxyhJWyfILOOyPMGnTeZV7WXJFt6+YQKpI+00zThQBGrJe5SYbRNzdnxE
	qzWgejUAiP8diWBk4AeIQ3WOcB9VeY+rWNhRrB81WgNfiRYruKLKb/TC5d6ri7oTnUKV
	REI19YadPkVl7UU4ZBiRrDaj3IvK7Ac0+Tpfmn4OsY5wiC+tSQnynIOaO4yWFYdKnOvf
	lng/UPwA9m1WfiRnV/N/xV9On2XAh7rGpCWOzcsTPJr5qCk0NchTHA/hz8YXs4Ubytzk
	CAVFUMaMujW/oSBgBs+f/UghtocNVNSgNSgQtCVFbE3EXwMWE6qAOOhQGtAFV6/Yp61M
	zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qymqxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Nov 2021 08:49:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI8ekkw174784;
	Thu, 18 Nov 2021 08:49:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by aserp3020.oracle.com with ESMTP id 3ca5688ekq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Nov 2021 08:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=L9pFh1mH5vmtlP1js4z7BacghJwGkTLTFu8ukWVAInwDq9gnphQhzMWZBxC8cmw6voxZ40PoAMYiwJjoP81UgViO7kHetOt5ZtFMaIauE/YK5qAoKqJGAJRdVNdazM6GExmXR57+4EpTpJ4x8+kLciQ8aYp92e46n/o1TgGeBzuXtkHOacgzJs765Tdge2uEWJiQr8zoijC42O0iPe+A3tpxZIA7us2zwAQd1cc28YPSZl5Bxm/9mBaI20r0ZPs2b6E+CWKAv6SELLD+W/EZiz6sy5Kj/MqMl7u8+zlQOJgimTNUwiB7p2itHjjYm7SeaoAa1tYOXHMj6hnDLzoeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=CxGDXlmpz2pQo5ev5RK2zfe6yB8VtYWiBcRAyhKZBTw=;
	b=CXPelbZqYnm/4LXvfUSvMpcVAqdKlfYOKpt+8JK4fko+ua0rxYrhhym+PLZqCVbMc/8lU6hbafyGXEbdAgwc7A2Ovjde/BJKt/XQkkaOlAJLGBsLiy9oo0HQ2TJFQxGLlck8WXKUXBJFcKzyiobB9fx9uFmUC2eFzbey2rP4WMChMkUcV5tzAuD5G7pEPw2+m8NidSc/HV2mxAoX4SAVWZpR3fryzcFEChXgBMqMhFd3+dMXrBHngNGKnntUR+aEEJ78eCWv49BhAmXCOvVoMHAa6UcQ8TlnKmJFSG8qYC/SrA0omVWZU6+q2csOdL1L4PDu9wpggLdVkUGK2w6IbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
	dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CxGDXlmpz2pQo5ev5RK2zfe6yB8VtYWiBcRAyhKZBTw=;
	b=jLc1aHO+Erz1dXUi6vV1fDqAv6mGTRBWF6Le8KRV41TCjDsUXQXx62X7keX0EWnYBxOjsrKGGsVXfBAtR57K5fcFLpSFr6HvQ0UiZeJ8+9yq9O29Yu8wBUMeN/VJ4uVbO1Hoop50Swrr7Fa4ZFLK4kpS70RbbG3qhzFl5GJalYA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by CO1PR10MB4754.namprd10.prod.outlook.com
	(2603:10b6:303:91::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19;
	Thu, 18 Nov 2021 08:49:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::d409:11b5:5eb2:6be9]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016;
	Thu, 18 Nov 2021 08:49:39 +0000
Date: Thu, 18 Nov 2021 11:49:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: agruen@linbit.com
Message-ID: <20211118084930.GB24550@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:22::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:22::19) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4713.21 via Frontend Transport;
	Thu, 18 Nov 2021 08:49:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6d023f3-dcbe-46b6-e959-08d9aa705af6
X-MS-TrafficTypeDiagnostic: CO1PR10MB4754:
X-Microsoft-Antispam-PRVS: <CO1PR10MB475457A45C56944052F238BC8E9B9@CO1PR10MB4754.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLOKRjcJUceW9+Oq3nNCJR4tiU7ui7ezYg0sdMsjC2mpOfcGkdC4m+1js7TVHR8HMmjlRybySHee+B7hnvAjPdZFxLihoBVqze8UnuCgNIiHyDjpvz8p8j7UdnKzqIFJgTsqAeKJAT1TbGcHm67H3mQVw/BuxevVtxglW7lh5NxO3M9NV57+0Pp/DHkk4b2B2Of5nvThtee38Gv2gaScTBNtIaRZIUgJoxe5VCgpXIjkqRKOXCKoeVOw3EcuRgU+Rr5lQdbw9MxCwtGST6Csp3WvILt7PQO3ZhURghufwm0jzQPQZDMzJe4xAzdV8/7uQc31hMA4dhDCe4U92GdvIrQDnzwBa6npDHccoDs4T3feQZT1c6QSt6HopntUiZSaABqNkcnkI4zilxaFRLmo+DUzJFTLJW/veGFDIMuMDpc48OyVaetKxGN/MQO6pO8G9xaUJTjBG4bl9/HIrXD+1FSUokfc9mziub908tZIW2I/P0Vy+99mLJB2siwtCdJ8jA8jRd7hxSwdgA7jHy9niBu2UEqLc0cmLw/bn8OUQeNlVzFv8qSCgGerd5N4D6ylb8I5Dmvynh5bvN/wSkHD7o1ndOX50ymIhxg4UAgQnbVHu1eLK8ez19byL+ytsu+2kgwdPOew/Y7aWoVtrMjLrqkpAYF/wr3gOCc+IU/iybjJWv+d/EJX+vYInJdjKAFFAlsGMLjwVFeBKRwXe085Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(366004)(186003)(66476007)(66556008)(66946007)(44832011)(956004)(316002)(86362001)(83380400001)(33716001)(2906002)(4326008)(38350700002)(38100700002)(33656002)(508600001)(5660300002)(1076003)(52116002)(8676002)(6496006)(55016002)(9576002)(9686003)(6666004)(26005)(6916009)(8936002);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4lz1Gn1wjZzmxrtThygSPNq/miYrqyJ3+NqJRbUiH3a96FXtuePL1D41fd+n?=
	=?us-ascii?Q?/MRHYPG5BYKQ7hVJhq/GIGGIcp+tpTeLKSJ6wPjbDEiIOhgby5bIKS6pXRq9?=
	=?us-ascii?Q?bjU1kQWzivm42RZZs8oAeQqWCW9rvRG+yvuUdeY0DX3oayqjg0HKRVygwZ+h?=
	=?us-ascii?Q?qqpio9ToHGtH30WZK7z46pn1ITub4j6id3tlhst3Eyf0X7pQMuKWuZnevfo0?=
	=?us-ascii?Q?tgDqRr70uuyqKtXcYCy7T4JBs2d2DdLTVSEhYY8vDJf/D9uSg0gziAR7jqKT?=
	=?us-ascii?Q?7zweCcyEJoo1YJJtZOpsp9pTFsyB4D9QikCtagAiafXnUORK/pda60gujrSo?=
	=?us-ascii?Q?GEPi9azwgV9uSkkVWXggXI9L8cpGzs7+rBVn94dsP65Gp4LUpySysIUjFuZX?=
	=?us-ascii?Q?+h5cYNWraDPBmqj25S2bOQECwwknL6k4RtBkBk2hqosFA6Sz9nhqYbdLteJq?=
	=?us-ascii?Q?KQiYVDr6xl1ap6L7EgjopEPmgeExnBtAGX6sJFuK+RoXfDauzLPcC545tQzx?=
	=?us-ascii?Q?urazTroUb9h1xOAEUc1+7PPeE4QemdV/bEPxbjFLl+CzKhxV6zNcLmfUfqZo?=
	=?us-ascii?Q?WQuqFVmBLf8rIiZDaI0sxDQxBXoyzwAtG4qf9JUjlYnx3LCQYhsuEuyzpcph?=
	=?us-ascii?Q?z+2otx7D8clzpBDmNlv02mYHKEj5nsB7zzs8KLvXn4VnQipwiqQmp2OILVaX?=
	=?us-ascii?Q?PAsS5d85OcxzNx79Ue7Rm9U76APdxWG2JmUqcaglqVGW3gQ4p7o1hWbJdLgJ?=
	=?us-ascii?Q?9vRiAywpm/C7zBIey/CxEpr1iQ7oEYInLal5G949rmni2fWfZJ1EdrwaIthw?=
	=?us-ascii?Q?HmglpVxyJbk4ITRdlamWvlZDZZjoYPXsm7qHEx8TNgbNemXZaz/OUh3EzEO7?=
	=?us-ascii?Q?XWHrvgpqMD+BVPmvSWhrrvffPpyDhn+qOIyn71uOFTOzs3w4WymyFYb9ThnU?=
	=?us-ascii?Q?NpVsSNSwMoQvjm/cV/wrVJoL5N7jLBmbVIOA0Cfpk9YGIpQ4BUnVtaAjVZL5?=
	=?us-ascii?Q?++n+FS+n+6T3Wzvcqswb2VAfw+1gaH1d6rDRNPxZiwVMNq6g4wbRgVNTdcrq?=
	=?us-ascii?Q?+zl+gPStgx/NhoXh2mG53JQ/ySEEBDX0m6DTflXlc0XaqQLVhrEt5594U18r?=
	=?us-ascii?Q?Dxpa889108Pe05BKiEIyQKz6Kzsmfxn0EILulG/usSokc1nEQjxq/3RIKYYp?=
	=?us-ascii?Q?wZAWAnY1vC68WHiUq8cslk5maZbikLvjLiOnrWD4fPH6NQH0EC3sZBQs0t9J?=
	=?us-ascii?Q?m6MjztPN1ytqe9GfDnJ8boQnZSuPsgzi4Ai2ETUVnLFx3m4LATI5CgzWUd2s?=
	=?us-ascii?Q?acHGTVkRDa82VeGWa9B6kY+7P4r0g2pb0eaPEgBjKMMNZ8gU+pm0oVsZh8Hl?=
	=?us-ascii?Q?4BP+ZRULGP+Xpxe+CAc/1f4hOlbrIKh9sNk4o0t15DphPHv4fJEtURPQ778/?=
	=?us-ascii?Q?/wSCGHh3VQlVSuuwo6dWF/y7lgZXGWg/0RVwIKETjyJ8ELNT8SVME5oyilNu?=
	=?us-ascii?Q?kF8P4Z5JN50WKQ3PLZuH7VPZr2B9Vpkp3OJzjhjjBDbjh8cRNlXnxERFtq3N?=
	=?us-ascii?Q?KiMgZHYQ+oCX+eEJpXRunpV/QEIcHu3S+OQ/EBf0xwBgrWAxIcfY1oPUjTQq?=
	=?us-ascii?Q?K6JLvXXlWmwiA3eHIWalfLtPK6hG/HIE7w8cYGNmiXZBywY2qXdfGRLzgiVY?=
	=?us-ascii?Q?q1BVZEEkXnUk7idAm4MQ3EUH1FY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d023f3-dcbe-46b6-e959-08d9aa705af6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:49:38.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKhGL3kx0OkyIVQ4vI6cJqZA2ox8n2eksFXefYLVhmopal++cltZM8YEy5dX8UuuNCG5Uj13wOKGgeQ6k1zuW++ZXyUxQtcZJvrgmLH+fDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	adultscore=0 mlxscore=0
	spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2110150000 definitions=main-2111180050
X-Proofpoint-ORIG-GUID: 1xRGVM5pHUD2_ilRTtYT7Fk15zgzw49c
X-Proofpoint-GUID: 1xRGVM5pHUD2_ilRTtYT7Fk15zgzw49c
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:14:18 +0100
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [bug report] drbd: Backport the "status" command
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

Hello Andreas Gruenbacher,

The patch a55bbd375d18: "drbd: Backport the "status" command" from
Aug 28, 2014, leads to the following Smatch static checker warning:

drivers/block/drbd/drbd_nl.c:3424 drbd_adm_dump_devices() warn: 'resource_filter' could be an error pointer
drivers/block/drbd/drbd_nl.c:3513 drbd_adm_dump_connections() warn: 'resource_filter' could be an error pointer
drivers/block/drbd/drbd_nl.c:3674 drbd_adm_dump_peer_devices() warn: 'resource_filter' could be an error pointer

drivers/block/drbd/drbd_nl.c
    3410 int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
    3411 {
    3412         struct nlattr *resource_filter;
    3413         struct drbd_resource *resource;
    3414         struct drbd_device *device;
    3415         int minor, err, retcode;
    3416         struct drbd_genlmsghdr *dh;
    3417         struct device_info device_info;
    3418         struct device_statistics device_statistics;
    3419         struct idr *idr_to_search;
    3420 
    3421         resource = (struct drbd_resource *)cb->args[0];
    3422         if (!cb->args[0] && !cb->args[1]) {
    3423                 resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
--> 3424                 if (resource_filter) {

The find_cfg_context_attr() function returns both NULL and error
pointers.  It if returns an error pointer here then that will lead to a
crash.  None of the callers check for error pointers.

    3425                         retcode = ERR_RES_NOT_KNOWN;
    3426                         resource = drbd_find_resource(nla_data(resource_filter));
    3427                         if (!resource)
    3428                                 goto put_result;
    3429                         cb->args[0] = (long)resource;
    3430                 }
    3431         }
    3432 
    3433         rcu_read_lock();
    3434         minor = cb->args[1];

regards,
dan carpenter
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
