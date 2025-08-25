Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D713AB34E3C
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Aug 2025 23:44:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 197991622B4;
	Mon, 25 Aug 2025 23:44:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
	[205.220.165.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1BC51622B4
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 23:44:30 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
	57PJDWLL024981; Mon, 25 Aug 2025 19:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=B6L9mBXrz/KGuf9xBX
	cChV05DVEkH17z2SIXrlALDpg=; b=NFHy6sRtMUHPhpJeGjAICr4pFvFcw3YOPk
	cLv3jBkWOppvGxhnIDybtkFIcKrFjCo7F+vFEgrbz1l5Wt/DBK5rTrS+92+hzOmf
	RLfzNSXN0mNDyMQ51852FslCtVKIOWC+s68MByzvzErmrtBEQpkQPV9IIDG6lQoo
	9vXwlSlnwW99JtUS2iXmON/8E5884vkLFFIqBeg41B+++vSRpa3R6hd0bbVMzM8L
	gszRJuI+vNw4Zee2NQXqbSx1Bblf7p1Jii3HBSJBP1X4GpX4aAPcOfInkuFloMnZ
	LrUwcEZsCs3bX+Feyg0cC6z0LpwvT/GY+MtUz4c6M45XaF5ZloiA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
	(phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8tw9u50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 19:54:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
	[127.0.0.1]) by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
	(8.18.1.2/8.18.1.2) with ESMTP id 57PJ9KlN004952; 
	Mon, 25 Aug 2025 19:54:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
	ESMTPS id 48q438uerf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 19:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=G8DyfgWYgbl4dRS3rdLfckU3G73MpnyYovzPi+88M+FvUfQbqLh1UayhPM+GyIX9nuu0ALSJKHb0U6qj3R+wPOEgnSKpa3R9KamtFVjv+3ZxReuMADVKvYa64fT8VCAAqOsSIEGRapWzuEfr3G0n4XmR7SJpX6HV1EONd33AZ9McYcK5bwZded+Lx+Jsbu3QHCoE730+aITFDOqT5YtUwRF2p/i9EpT0WPHe8+27HYTmdm+ej4UEnqnUlQYYHcIgjr7sBca1OVAM8HTkUxmchshg7zQiPNAa/SMjv44vFZnDtjV5frEOkwbDur8ur7qSxIQzshD9iJ9BL/xB+imGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=B6L9mBXrz/KGuf9xBXcChV05DVEkH17z2SIXrlALDpg=;
	b=Dw2rOCP1EdcDqDechKZtkuzyUpDcpi4qCYd4uCgn7nBiWlrSQQyiL9sUzetAFgLO26Zx1XqwMNk61u/Bqh6/E0QlMn3wYG/NOFce9ZpCVf4V+G++4r+nynj20c+YSy27wzJ5OX6+hxjEzQO4+eNK9dQMfWq2tzWYoBWBz7LcY5VinFqBZK/ZRXIpiGf+w/s6CjK0+HH+QeOL2Sod1tCzkn0QS5mNBcsoByixZkFFIxaXi4gF/gh1+8vFr2OljuADbTu7skp+y1KFr3l5CngQr3c6C8bytistzemLS0vQStMVebLGvMzoC8B2XhqIWufZ+43D1iXO1k7TuQg+eoii2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
	dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=B6L9mBXrz/KGuf9xBXcChV05DVEkH17z2SIXrlALDpg=;
	b=IYMDSg/BOHkY3SVlfKr9VQBgp1IaF/EgNoPnH0vHIVOEI6o7QeS+8r/Clj/PBcn6yQx0gnGvWmDZCj2/zcc2zUBfzpF5MywfXFHp0CU1i00z0HXXKyt11Ei46z56ptwy44vJQl618q8H1RhdR2jYmql8o7k4FaZjw03B+miedCc=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
	by CH3PR10MB7258.namprd10.prod.outlook.com (2603:10b6:610:124::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21;
	Mon, 25 Aug 2025 19:54:25 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
	([fe80::5cca:2bcc:cedb:d9bf]) by
	CH0PR10MB5338.namprd10.prod.outlook.com
	([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014;
	Mon, 25 Aug 2025 19:54:25 +0000
To: Zhang Yi <yi.zhang@huaweicloud.com>
Subject: Re: [PATCH 0/2] Fix the initialization of
	max_hw_wzeroes_unmap_sectors for stacking drivers
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250825083320.797165-1-yi.zhang@huaweicloud.com> (Zhang Yi's
	message of "Mon, 25 Aug 2025 16:33:18 +0800")
Organization: Oracle Corporation
Message-ID: <yq1zfbnp480.fsf@ca-mkp.ca.oracle.com>
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
Date: Mon, 25 Aug 2025 15:54:22 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
	(2603:10b6:a03:2c2::35) To CH0PR10MB5338.namprd10.prod.outlook.com
	(2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bfee12-0a34-4cd0-f8a9-08dde411315b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lyXPQ4uTIC1exS4kvnBggKuyb6O/4AEwFZ0PkixTmdZ5XwF4oAlBuMQpH7t+?=
	=?us-ascii?Q?nA8vJZ0pv25AkrgyVpHqDHq89EgK9hR2i9E0BkOuP3ZCZHCnlrEs7cVAVAdE?=
	=?us-ascii?Q?dsIumqwJ4nkismZ9I8yquxzsBjdtHu4ugm26FpNLMd5N1zggm5l27ziB+bdu?=
	=?us-ascii?Q?UykI+THfhB9cspZzwBZeVkRWrJDDgJtygko1qF1IlVz8bulPmyO2jzVL86sV?=
	=?us-ascii?Q?632gqzOfl70XZppjQKI1cmQ0c730IIyroCoGu4nck6xvhLLK9AbC9pCtZY5F?=
	=?us-ascii?Q?jv3yBOylENMXVlBoL0utUeYSSL/gCVH0+aOUu/Tx1I5S1TbjTSehUpbcPVRs?=
	=?us-ascii?Q?O+DfWBba2WlF8R0phXs6t7/dzP8RgDqzpAepOWZR2XvgaOJpEH1wurFXRgP6?=
	=?us-ascii?Q?8lkqIxX9OYVQQ+UfYq241yYJneR3rbrXxZFzaoWeWg6A+Zmp74QhxfM4SuNu?=
	=?us-ascii?Q?jIcZWuuPFgwbT2vHKhbzkBz3ugEGR3KGkraRoSppiHXWeAEFivzH30ukkxfv?=
	=?us-ascii?Q?FSRXZwDp7LhW+f9gMl5LryyE61DMl/1GkFcVDrQmUnpdB7YudqiIGSAmNAyc?=
	=?us-ascii?Q?mrmpU27XTrEsRdm/Q4v717ykUSAoeuz3OKsevl39++hN4SJAalVrKErwXTaq?=
	=?us-ascii?Q?qSyqwNB0QSL5bxSru0o24x6hJ34C4QKla3zvDAESL2IWCPDZOeTMakGnQ5no?=
	=?us-ascii?Q?AUhhhYr50dlIACeBtrGwpYpxYJEWzdfeL9dmqD6WL8OGJ6o0nn4W96DkEv79?=
	=?us-ascii?Q?o/106xWIl/vl1vR1jyGxprf1gKEKrUA+xZwimDM2b7B4+KM82ebmpecVR1fY?=
	=?us-ascii?Q?jjULc2nZMgmFEekKx45GTQLTac/agpsDDn5j64h7fDvLO++GnQxRvLjBwbJv?=
	=?us-ascii?Q?TRDhzL4wIdLLcQWaUAhIgDt6Ky9OshCHvGf8sc5Zs7TyaiB72sdU8uZzKZpi?=
	=?us-ascii?Q?yptnYKYrl6a7smrj6YguUNcJ+SySht5/InyqaY0nBW00YlWQjp0Moh1hjv6c?=
	=?us-ascii?Q?bm0Ev2NiYYFEy4gta+T7q7WtxX46n8USsOiW9lGZXfUoju1sGiIwQ4DlObdX?=
	=?us-ascii?Q?pzR5GfaKc6tsgyke2KZiAZD+JZXYXxAfTrw0VpKH+N0FLH1618rqkrs5PrH5?=
	=?us-ascii?Q?LoVczcHuaQ5FhQVLQoBxJ797KLW6BkwrDYOCVKpG+6MU6IJ4STtDYGZfJyDO?=
	=?us-ascii?Q?HW6rlFedp6sw04+ibh1k+maXBErTpbbvPX1GO3/kG29MKDUqy0EaY4ob6G/R?=
	=?us-ascii?Q?NUG1YEFw34XBTkeKCsxcq+VF/Z/WNYRU7ZWcfnzpIw/lnBjtauYOPQDAJI4C?=
	=?us-ascii?Q?fX3IktsCw2Up5Q22rdOUT+Yq/rs/G9TeXo6WGGocm7xy+iYSbFFeSvtVTAfQ?=
	=?us-ascii?Q?nWP+c/Q8ZLervbsN1VWZu1LLzP5B+/i5+oC+lajYRxf7sn7Ndw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
	SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5yySbzcDTH+88ocEf2NNQqbnZL29Po43vG/WT4K1WLLAdMDTTCD25hy5QAh?=
	=?us-ascii?Q?UZhg9QCpNuWmG3gbi57hV0YX06AOleYBO/KPoBG1oBoJ0wEpQSu1/hpl0TCs?=
	=?us-ascii?Q?VmHa+W3inCBWijS7+l0ZGXM7dCqMHp+lXtIsI4zTXUgin4oH5DNrdUtVNc+u?=
	=?us-ascii?Q?ytdDQvWKESZnjuCuVZb+9+o5k9KWtS7FQdOpga5eyDapFF4lx2V6PcX2zwgv?=
	=?us-ascii?Q?+kjylEdZsQJrYfw+gzgnulnwDSx3tFabfq03tqfMQDt1gGwf0zFF/j/WHiTT?=
	=?us-ascii?Q?/hPEKE1sHyMMOOsBK/OxX2hqXSZG44HN63mPUiDuxnthCUiQZF/hZAz4yQll?=
	=?us-ascii?Q?qzxQtEm7ABWVlpqE124z2aMOaTAyJDXP4esfsWRFBRD9NTS3Kjdhs6DVBShu?=
	=?us-ascii?Q?bHNp/0ed3HFTFhl0bv5RDBOmzOvj8RXAfbK7IJX6lKPZDEoGTFKOPmJtM0xZ?=
	=?us-ascii?Q?c+VoPVgeCdoEC86aSNThcGaXgPkaakWkmeNw5xJvby3yjDOeQfKCo1jf+6Rk?=
	=?us-ascii?Q?LeZEvYs50dbEJs6JnS37+JYXpvBxlFYGYCwjwXtx66U8YDsLJRC1ZRnJgpgT?=
	=?us-ascii?Q?GSGMT9ZQI/4npZTYZyZwNFxw2hrMEBcMIZ7x1SndUB6aCwsb3JSgNTps1+Kq?=
	=?us-ascii?Q?hpNrORVkfGo9SB6HEi6PKbEQmAGym3DEZI3fNJ1y5b3nfgVlMYrBVe35H94B?=
	=?us-ascii?Q?XtFdI2q9qpSFVWIM2SYmu4sUkn9UJSnOTmAJbZXc/UIaCzq44eJr/5mLmvbB?=
	=?us-ascii?Q?KhokmVFOaDpt97C7dWYpmfKV0D9uIxsbiCu7eBSt7Gy/X57K2Lzp80rQCnTd?=
	=?us-ascii?Q?6sw5SIbd7XcE4E4JdGpxvisF4Ozmyb8vLSLc799jcBWvBleKKbg7JDp3JQP9?=
	=?us-ascii?Q?XJ0eCwVqYhSCCQBUxsy8Fj0w4ZtItgiRe5JgCBbYyZFm5kV0lvO/Z17538Yv?=
	=?us-ascii?Q?Y9IW7sIGbN7DntcJme5MjLsiOqq2gHP+ZwIncKE6yPQg/yaJc+uCnm5/6J7n?=
	=?us-ascii?Q?dUf+zh0CMvFmXui7Evlsa838GUNguZSVAI1/CILmWBE/vGSI9AbFTAUteCZa?=
	=?us-ascii?Q?ovHAi8n84dPFNRofeO9ikDYMCWaVE14frl2iPYLOtUXRdfEdXjfxkcsGv1zw?=
	=?us-ascii?Q?J0x627+Lzg3twzo0eajNgpEL8nSbFxpPQOPTgXurq15op5hK5ALMbGHeqErg?=
	=?us-ascii?Q?k8IE69e149egeXoConajmvgAuBbCKw8U1UtYW09WDTYn2HFDSXev0dx1cZyN?=
	=?us-ascii?Q?YGtxHfXhlqeUPWqGwmfJNPsDnQHUi5lNGqOOy8Dd8r1oxMKCHv2L4LV1ghiB?=
	=?us-ascii?Q?SnmZ1NZ2uqwtIP9vF/zYaZE4QHa0klo09k0cr6GZay+DDpKF8xJRuabIPCyx?=
	=?us-ascii?Q?aGBqT4dR8W8CTGoFq1ZvXSz8THhbZHDOy1wyNmjrz/kH16dnJqnX8QUqW6AE?=
	=?us-ascii?Q?4dzumQF87sVHFf0qSbBa6iS7UKjbXqlHbpY/Qj1mjK2fdWbPUA9T5iiEyRN5?=
	=?us-ascii?Q?3BFqBcsr17H0c4NQbomYVVgK3sWhLd/+wSH9xlHMFNX8tCrw7gpT9l7EdUb5?=
	=?us-ascii?Q?ChvtNQOhxbg9ULesKvkxSNWgPHLgBEVzhfWQgDwLl8xHKXQ9WJuIiaRVQYWx?=
	=?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IJTDuzMnGNYL4/2RgLeXTI+HZRkBIguGUVvrKnvdrFFzZYVHZniGw079UpbIteIKowmhjUaLoAaOWduu5irThgAZOnLXau7MykLIc+KEdV8fVA3OfAap5eQNMKFTPcytBNuUcOC9995R5CT2vWFHtK5kREPqJGMRpPV5P8aMg1M0WdPOffVnSZ/kvM3x9h3Ua4ebMDZ7ScMOHzGfusGUGVmB59YLuztHRXbeLAiSXCD3qIgLNusQbGu6WZfJeeqc/xdK2foMi4F4OpkUhM6efrvmpcu3M+SPVxQPRkProC2/8/JNqA2t6D+dJwX8ayDD5uf28X1C9hvQHI8UV/A/cvBB0o6dJlukDk/nP/JdgHlkiq4V/qLPr6EpLoeN8ztqAeilZ5dNGpUCikvPEdnQukb4WYVN3rs2hfU7YclogSuM5idJVnlNv5xmFBzlLvhUPIkDiTMGL+AJfUTO0cgSAVvN8qGXO4AVTXNieh472dyEn4RazA77g8QlUorw00oG1oLPMZk9v2M07NcUOr9B+mHFdQQfnLfYZtdst8A7dZHILypkIydLTOGOqBaiCjpjBt86eiwWDkBWAYuo1pTrNUshyXMte37ga0VIc/B1PSA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bfee12-0a34-4cd0-f8a9-08dde411315b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 19:54:25.1482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0QwzpgCuTEOKuypG4F0eBwfPK3INCDTE+I1JvalIG11cIGIhkbQ/vJipR5Fi7gEeTFq6jWCoPintSuV5TbBsALXrXmiymVvuhKffsi24ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7258
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
	definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	bulkscore=0
	mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2508110000 definitions=main-2508250180
X-Proofpoint-ORIG-GUID: QmLqiM-iqEbodTTT6ufEYRj4zIuJkFmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfXwdQ5tnBK+EpO
	GEFlFqlwrCD/CyOGNiOkg3xqPs4T/0akv79GiBG85Ts9tghjRtk2/T9YjD3FKRUX0sgZWVhJSGm
	0bA2z686A9fci8JjA0AZX5I+LrpUg3xDjcx1Epl2V/3oaLd26ulo4oDfUhJ6ienN3qWmefSkKPr
	1WkZfl/3yKz2/p1HUL0tKlofESeNHMr2fuRlLiAXGw5jtyAsSAbCtlyYoEpnY+0jgwcvnZdFD1O
	NlHmyxiYZJX9vWjjebNhfqnvGJE4gei/K0byh2Ks5vbT0QMyp7QT481T/JRQZnq8oWRdVUoTy5J
	OxTTiLyE66HgWI94HC/VzGJXHPh+pQdremanQRtcugWXh7W4ce1YQUaZCGRQKN/itnvBd5B8sMG
	TwIGfeN7
X-Proofpoint-GUID: QmLqiM-iqEbodTTT6ufEYRj4zIuJkFmU
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68acbf74 b=1 cx=c_pps
	a=WeWmnZmh0fydH62SvGsd2A==:117
	a=WeWmnZmh0fydH62SvGsd2A==:17
	a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
	a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
	a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
	a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NWDrhqrOra_wOMGATk4A:9
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, martin.petersen@oracle.com,
	john.g.garry@oracle.com, yangerkun@huawei.com,
	yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	yukuai3@huawei.com, hch@lst.de, drbd-dev@lists.linbit.com
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


Zhang,

> This series fixes the initialization of max_hw_wzeroes_unmap_sectors
> in queue_limits for all md raid and drbd drivers, preventing
> blk_validate_limits() failures on underlying devices that support the
> unmap write zeroes command.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen
