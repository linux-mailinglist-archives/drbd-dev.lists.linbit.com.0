Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF94BCB8D
	for <lists+drbd-dev@lfdr.de>; Sun, 20 Feb 2022 02:45:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B5E242177D;
	Sun, 20 Feb 2022 02:45:35 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
	[205.220.165.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE2A64205EC
	for <drbd-dev@lists.linbit.com>; Sun, 20 Feb 2022 02:45:32 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	21JKRM9x006833; Sun, 20 Feb 2022 01:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : message-id : references : date : in-reply-to : content-type :
	mime-version; s=corp-2021-07-09;
	bh=GoEyMw/Lh6yYRp8Qmev/8q//qBPwDnF7KPN4vmrbX1M=;
	b=Uzv4+/GhBBpxyfqB072zkmUW/LKj62SCD7tBJ8WD5VjAM4xKn/xabZlS6X3msw9bP6F6
	GngWMDGnfOItTX8Dti7H5cm9Vd+ci3g1Zvzrl687wxGvVHGoAjjmOnPEy5jihvno7a4a
	woPNbgZ7lp/6xSTiQ6BXipnFTokD5iy6OId/6guCJSsO3oq+aDuDz+tq3dBTuCukZOQo
	yPZ49UwwKUqg4fFr/WVj/thOd94vwoIGCIzpgznK8ljtBO6Hsk5lagnqN6U3PCaxMEpL
	Reh7mr2Theh29cyLGFw1DQHj9f0H+s2wuhmCGLm1aR3HjIdhAr6WhSi2mycFmX3zUZA7
	XQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3eaq5298fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Feb 2022 01:44:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21K1aKns051888;
	Sun, 20 Feb 2022 01:44:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by aserp3020.oracle.com with ESMTP id 3eb47x7p1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Feb 2022 01:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EyCUS8tVF79+NYl/8uB+MmkJbBXYkkfmUHPqGnDIYzk/X39NkMx/gDOYGu0kOWhOpwER9X/64fOLNuNVRnuDkN9JkNS5e+Cs/7RGm1YoInH/GyZv2SsspONExzgrTf9lXHBFlPXS9AirwWPiLkKpmGtZVtxuTgxBfOVQy6p6M1Rm/3LqfyrLtsRPkO+kyQouLU9GwFJf52RIrjlyWUDzwP8/vnvDr4AqIptLF6LRxEzqps3sWUgn/tcLu4HCNn4UWaAn0+7t+xh2InRcr2ZncQdv3L1rN18G7enbF2xDRSORxz7SvmFsl1onLiuZvrTBmydKO3vsBFynT56/zV8oBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=GoEyMw/Lh6yYRp8Qmev/8q//qBPwDnF7KPN4vmrbX1M=;
	b=LPGYR154Nv/uqgxr03c+2KVkgca21dWNdsZx8FHS+G1gVtmGzTSas8jZntde8yDIVjArrH9+7yVOrC39xPCpV0G6B3eaix98a4U6JBoD5q9QH1+a2W2XkX1HjaTBCAjssmBhzFfysERDGU42Nx4ENi4OBptnzevBqd258NiMdggvlVnfohjI0tnsnfb0WcNwg+xDvjKYpJTWrTj1UhPE7AyX4oC+bwFdXo2yYPuhXhcjf3c1ZH7xNBkKNwsR3OQE3GNo/3MfbLubohCfMhzXKRmJR3dsqGXh+G7ggSXr8IjFD/KC0LtxcznQsltHvv6rgKIf7XRtaBbkAQDcHEShzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
	dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GoEyMw/Lh6yYRp8Qmev/8q//qBPwDnF7KPN4vmrbX1M=;
	b=0VBR1tDdNitEoqTpGtbpNmdNuhUoQPk3B5ICA5ghK8BAzavnfAWFHed8NSNYaSgMvgf/x33+M9nY/3ik5oh1hP7rGEz/LSrT1vIsB+nU5D0/kvx0pYbBuzQLgx6Rgq7PMuy7HlKP4HrSce/abKp/MkspiWlKqJFvxbEJSQMu7DI=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
	by PH0PR10MB4502.namprd10.prod.outlook.com (2603:10b6:510:31::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16;
	Sun, 20 Feb 2022 01:44:20 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593]) by
	PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593%5]) with mapi id 15.20.4995.026;
	Sun, 20 Feb 2022 01:44:20 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq135kefh5j.fsf@ca-mkp.ca.oracle.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-8-hch@lst.de>
Date: Sat, 19 Feb 2022 20:44:18 -0500
In-Reply-To: <20220209082828.2629273-8-hch@lst.de> (Christoph Hellwig's
	message of "Wed, 9 Feb 2022 09:28:28 +0100")
X-ClientProxiedBy: SN4PR0401CA0045.namprd04.prod.outlook.com
	(2603:10b6:803:2a::31) To PH0PR10MB4759.namprd10.prod.outlook.com
	(2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15466686-29c0-4226-266b-08d9f41283aa
X-MS-TrafficTypeDiagnostic: PH0PR10MB4502:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4502035F8FD4645B784D14668E399@PH0PR10MB4502.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mk5XE/LMrtHaWtjoDaBNV4Nt7vGJ1n7DC9JlupV4etyWVgNTem6/2pKEovthq7n99hWzQilIBohMw9qyFdp+txwemFUvJHWYpS1lOEi8+J7LkHLq9AkOXE3zlREzLWZanq5Fqwi5XFDQxB8MIdVUS26UFxYLMc7+pVoBTH7jB5Tgtd84f6hsdwsvamFNhQvsXUsn417g86jdVWrwseW90lV7ZVEZ9baXaxtx68n7s83M+rrO7SuLjh+SL6wVrr5ZeWQEOpSx5YGvXzvZvQ1BT/Ed0KsFeh8cxWUQwztXnC44ScHnXRTIZzA42X70+jWpipjygmPitlJI+gUztRzess1CTY1yohRNSTUwB2Y9nK2r8DT2kuFGoh5mgdqrpdGGywKpBtaM+X59LQXlrrepG240bi6rtDV77dUAyHVCosG9b33eoPP4SoRQqUw2bhT0WebXkf5XPQW+TqcC0RDLj6/hs/225e2FCDenYo8/qANz/d34zRpZuj7v3n47GD9QNApBMVw4F5Y8QiwA2sYxLO46jeuEqlhcvWgiCNZVOM/9kqL0EbErElsp2yGqRa6KreagHQGFcptRnbNKydqo1Uzv3khpE5JOzGrcdnEHksnKmfjzNn+P+4+AHJoeDNJdUJ9jwzJb3whasH2lBO99sdinUw78L5AePGST7N5kFd4ZU8X30NXyrqhOozHAEADASjW+exoiCXOB3TO+qHno3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(366004)(83380400001)(186003)(26005)(38100700002)(38350700002)(6486002)(2906002)(6512007)(86362001)(316002)(8936002)(6916009)(5660300002)(7416002)(4744005)(52116002)(66946007)(508600001)(8676002)(4326008)(66556008)(66476007)(6506007)(36916002);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jU95vCxaEzihp6lWK+gLhHqnyYKuhJY6+WHIe0kVGDMPMixeT0gS+KqxSKEw?=
	=?us-ascii?Q?7KVVaRWs7GNbzLoX+lBf82ak2dlLy0Nl49icIsbzTGc5ypgOAM1FW63q265g?=
	=?us-ascii?Q?/hdhavE8+yox9bGLDSuQzHhWecr8C5adzWl7Ml8EKbDAPkE3ND2I57vglI6+?=
	=?us-ascii?Q?259A1rZOqT5DcENeZlovB79Q1srQO8ZDuRN0X0gQWwZLsbL240s56MkOV67Q?=
	=?us-ascii?Q?orYzTr/Xs7h4kuj9BzRFw3Ph93N+yLsEsHS4GWKeqE3nkmurhE74XxG0AUSc?=
	=?us-ascii?Q?Yz3AUiJ7M3UncviOxLaxcVG3kKFi3I/FIYEoiQBxbpNzH6yUKHvXQDU5Q9sb?=
	=?us-ascii?Q?3MzXdpttEbnWYnSHTdfqJ6eJx68A5j0nOqqQ2I0qIaTTzsAxlN2lOepSPCxY?=
	=?us-ascii?Q?2MTlj2m7zpdvYhUlgAS4DUnThibsOl38Z3M/jKGeuj/R9QMWF8oP9HxNwJT7?=
	=?us-ascii?Q?siDqSR+iukXbThuQiU1dRhmsSNRzibniug4LjhDbKMuliSL80+jXkfXECKUL?=
	=?us-ascii?Q?9HmAhYYyaGQwAYvt4yEnV4EHDCbDihDqi6Jq6zjrEDbGyVZoTebV3VQaHbmd?=
	=?us-ascii?Q?fhX3uIKTzL+nXIdVIOCVSN2RP/jT4zctKZvNls4hoSxj11AprUv6SvlxKCzC?=
	=?us-ascii?Q?wrDz9VsWdmx/UbyfUH0tq8lBR5HhWve8SNI0VKk2GgVYbV7674ZTlSoexhgU?=
	=?us-ascii?Q?+V+qO4KHzzViq4XpeGcFjwvPuWgx1GrHKddhCkV4JIV21jDp4TPQ2d+ExPJH?=
	=?us-ascii?Q?C6txB2gwMGvdohkPkXBqI1JdFE1jT/6a1J2DhT814FcaVundZ1eLlLcJrmqq?=
	=?us-ascii?Q?e1qb0637k2ziu5MtNW1Qp+AsWaBI4IMuEUyt+e035gPcrXmcEbPzVx+urA7Q?=
	=?us-ascii?Q?bxSevyGbj21P7ERlrifvD3qdgDIRvmGifMeKnfa+e2jEJMisF8cOsWYMT9Vq?=
	=?us-ascii?Q?+OBFyvj6jqGrw3Dpp6He5dKVEf/WS3HYzjC3Wp33H0Yqsua7dfMWw9AUniea?=
	=?us-ascii?Q?DsljVDD9CmE8IxQBCg+fvCmvz/XDUrh9c3MxofeaYDMQXxImASHdC36z9m18?=
	=?us-ascii?Q?nImkMo2s0tFEvJ7gNttNqqn3DfXvWhDMP3R+xE4y9F0Rc9QdeseKPwATwk3b?=
	=?us-ascii?Q?Cou3tNT7Mr+V+rH5x14M1P0mx+9oAL3cgO5NRqBzdY6dKgNM9c3YWYHswuaU?=
	=?us-ascii?Q?N94riCZVEAwGOTR6r0Jvk49C+zBMM8DKR2gTuVydPbM1w78sRhiQyKmp6fKh?=
	=?us-ascii?Q?iqHepXVKXNRNsJ3D4si4A1EBC42uew/askCfwp/03TpRhnBf8+WNSolPDgX9?=
	=?us-ascii?Q?t6uWGxPLyKDgiUX2CXxsvvRbkoo7qIFFH6EoZXKga7XUqh3C93yyMGl42DSL?=
	=?us-ascii?Q?0rKilsShMhRdzbM504yB3QO1u8+PHWN1R25RLlbAk924mLknGfVeh/DWM7kv?=
	=?us-ascii?Q?kdWnEpBbop8AG6HbFCd6wCXIXiDBrpUPz/V/pH/Y90iGu9Q44m39IJh2KcnC?=
	=?us-ascii?Q?lkqUs7nKIwEcA8Ts7aloBiYmUiUecsUn/57YFZOam+c4Wf9BtyOxerV9fTQP?=
	=?us-ascii?Q?29IwUImEPGMjKmR5BSCGGTAZZ+47ARUy7PSsjAYpf3wVf+sabkMlz6ki8W2u?=
	=?us-ascii?Q?xm1/ne0zqOpJhUj59RsfaXoghTfn9qdfeGMvme/haf1VOlrWrCBqO6cN2yOU?=
	=?us-ascii?Q?0BHDB0b9BV7KIWe5Y0i2rXWzx84=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15466686-29c0-4226-266b-08d9f41283aa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2022 01:44:20.6284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdtYXDcqyrai1DnVnMYuPhSZ4DJqXbLSwoaadvHowRDZNGjcZUCHLtnYb9mHdYyW2OAm/QmHcbrQ/UVSHcqR2q9t6ZZOJG+/PlsWEgp1G98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4502
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10263
	signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	malwarescore=0
	mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2202200008
X-Proofpoint-GUID: qu4w8eJL-GPCQf5irrJgsFF5PHCiJ2j1
X-Proofpoint-ORIG-GUID: qu4w8eJL-GPCQf5irrJgsFF5PHCiJ2j1
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, jinpu.wang@ionos.com, mrochs@linux.ibm.com
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

> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 9f32882ceb2f6..4a5bb47bee3ce 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -212,12 +212,6 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
>  	return queue_var_show(0, page);
>  }
>  
> -static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
> -{
> -	return sprintf(page, "%llu\n",
> -		(unsigned long long)q->limits.max_write_same_sectors << 9);
> -}
> -

This tripped one of my test scripts. We should probably return 0 here
like we did for discard_zeroes_data and leave the sysfs entry in place.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
