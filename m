Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14D4BB192
	for <lists+drbd-dev@lfdr.de>; Fri, 18 Feb 2022 06:41:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 829A642177E;
	Fri, 18 Feb 2022 06:41:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 4389 seconds by postgrey-1.31 at mail19;
	Fri, 18 Feb 2022 06:41:20 CET
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC64642177B
	for <drbd-dev@lists.linbit.com>; Fri, 18 Feb 2022 06:41:20 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	21I3rMRj028289; Fri, 18 Feb 2022 04:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : message-id : references : date : in-reply-to : content-type :
	mime-version; s=corp-2021-07-09;
	bh=IaO+qn7i/9Hdgo3Ofju/oJij8LyggSQDjzgbNqinoYU=;
	b=R1Wkee81u1nZU8vHV93JGApV/mwMHlbqAEyCu/Ms2Ht7lxhtEqVnOkWMSad2I4P/il+G
	dsoEIIhaskVsJpm4hiZQRuHErDjvv302eFUqN/uck0iIeCwMSZ/JkM/Eg/y45A3sDiBN
	at2+AElFjEoK3+Xd8jBOPx1f+AsaHMk12COVVK8dlIEZprFODynl1yV/BLYIkfruLh7A
	hp4sRWAqsnhxACYhvUCqvvJWkwN3quwnNf3gcPTM4esc38Q2uxpQoytL1CYrpLzLULa6
	z8V0BBPgbGZjOG0j/zuYzsw07iMqN3o7zMceJy2dLbTu0eIWqkflp2lZx5/6P62BVxds
	fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncb03hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Feb 2022 04:28:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21I4Gj5d139027;
	Fri, 18 Feb 2022 04:28:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by aserp3030.oracle.com with ESMTP id 3e9brd8xsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Feb 2022 04:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=QhPufUlKq/SpQA8Z3Sg4lysKskDO83XPwP3asGMLSbyltXQ3JZHOG58QsaA+g1SB+1cP7/hKrESDrmXbCkwsvI1Nx9d1R6r2E6f450BAOknSyoAqPOExhYvRfFBq1yaPa8su9tTVC3Z84MwslCU6Qstu6WvRgp3hs8QDU4EMAbvjszW04ujZYCjYDeP+oL3x8cW6uD3r3Q4sGf8G4cuEcOxYCY09Z7lEFoZ7n2wS1GkASXpAlG68gSGI3oAunGQ+Cv/Z/jsQ5xCwzyMIEppXVs4ws3EewRKWqff1KJi1cRYCxqG3dx+HmIRNns4VupY5V+z2LAJg6o36mtvswINnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=IaO+qn7i/9Hdgo3Ofju/oJij8LyggSQDjzgbNqinoYU=;
	b=biyZ8tAEsdFhK0hgo1MiRG0V+27QOhlfLC8qoQDflAZ3O1ixjRy8KJOvPF94P+pPKh+ic9mMd/MOrtXy/5cwPyhxhemFu+XQZVd8CYbHuxx48tjOMTEfq9kZJ/0BCTSUIGk83E7NCUB6XcVvRaNYwD/OuYMAIKsR1DP6Y4j2Jbjavvim2lsk1SRmAhMkQ7SolnVnhknJ9CfFhDHsRQeBPnrl6hwMjRUo5TZdPKRqJseBtr9fgUKyuTV1iWFkuBHnhe2pPE5IVTMEjsBqkxzeoQudXVnfy8objwZu11lH6kELKzynyJGXYI4A1t+lUxoKHWkV9JI1czF1Eu53DIPd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
	dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IaO+qn7i/9Hdgo3Ofju/oJij8LyggSQDjzgbNqinoYU=;
	b=Pvun7OgEeU3+GHNWZqAnleAcC3K99aZa8uMo2imm18hG6DaapiB5nQw+uV8ZQI4n425ikk22Qk4oOIaQL8BQMQMVPL6hzuKa2WLeRm4prTqA6t8YbTnGsak6uXQFXaELmpTJzqV6ZnwHuLUJcZlKa0qIBWju9ppKzQ53REMgp/M=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
	by CH2PR10MB3879.namprd10.prod.outlook.com (2603:10b6:610:f::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17;
	Fri, 18 Feb 2022 04:27:58 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593]) by
	PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::c9f0:b3fb:25a6:3593%5]) with mapi id 15.20.4995.016;
	Fri, 18 Feb 2022 04:27:58 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1r180iyu8.fsf@ca-mkp.ca.oracle.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<yq1wni3sz4k.fsf@ca-mkp.ca.oracle.com> <20220210055151.GA3491@lst.de>
	<2f3f1c98-e013-ee03-2ffb-3a14730b13b9@kernel.dk>
	<20220217064349.GA374@lst.de>
Date: Thu, 17 Feb 2022 23:27:56 -0500
In-Reply-To: <20220217064349.GA374@lst.de> (Christoph Hellwig's message of
	"Thu, 17 Feb 2022 07:43:49 +0100")
X-ClientProxiedBy: SN2PR01CA0080.prod.exchangelabs.com (2603:10b6:800::48) To
	PH0PR10MB4759.namprd10.prod.outlook.com
	(2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d782960e-cdfc-4d21-9ddd-08d9f2970ac9
X-MS-TrafficTypeDiagnostic: CH2PR10MB3879:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3879DEF04E7D4E8CC678393D8E379@CH2PR10MB3879.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPb360cJclRtrtzrSH20bH0yjNjbW6PZyF6gcKu3FTHdqjkfsBOUT0WsL6sOod3TjoAQv/vfBRZB2zaxXpzllslkxHt7OuiD3y7w/42LEmhyiZTZavFurQO6S8D86RTPkJK5+QDve3lWpp3ZLdNQWZn/1C1pRru28S80CqqsAnNxGZrUhqHWCxRpsk4EGoHxtTt7PZP18X+2r8R79phicbZZ9eO8zZEsOOamnQv6izmIDJWtBpz32iuwQ2RphHzhRRBHwEJYDlPUgD4DtH6bydqyuM1x+obCfgSqME3B+/XzGc/uTpz6a8jfW5EXhSM8RBzg35TpXVwLA/Erug30s09fzESEtGPjWZfY4z1B/1OZiZvSapdI6b9r5WWqZGIACrcWogSufS9e5v7WLjRFtHN6F5iCc/sEK/lK49xa4Sz6+158PvDT6j/32jFgXDKQyc/rM9jxLGBgp0lXqdd3xGqftKLT1/cHxx6M9MlGrjPs1ogyUx0nYmvcL17fuUB00M1ZlWslHqwdLsDDSHzW8GBTEFGiqoEgSuphucyMnXl6nizazYOE+gbdRwrhVV1kGs2GMK3eJ5DMojqIix4uEwQ5KIgTd7KLmECCb7XzpalE2mN5N8t1sjBxaEwBG8jMEqGPDY+YjciefnTSHum/jTOKdFDsudgMMCVDxZnX9rQP4QxbYzvee3rB1/bK+fungE7NkGNe+NGXIoHrCyYL7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(366004)(508600001)(316002)(6486002)(6506007)(5660300002)(52116002)(7416002)(8936002)(4326008)(36916002)(66946007)(66476007)(66556008)(8676002)(7116003)(86362001)(83380400001)(4744005)(2906002)(6512007)(26005)(186003)(38100700002)(38350700002)(54906003)(6916009);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fL1D0e9PPiYkh9RieoTbPAP217SfYcNkj9wpkSdrzTyPEeBvyfAnbs26EYEs?=
	=?us-ascii?Q?FT0gcIZQvQZXTFHFh85Q4z3nTEgaurj9OfoA9erUdTIpIbVdFLUUWa8JF0GH?=
	=?us-ascii?Q?4AbGFk8b9X4lchbaUCLy23t5cXY6ejdht05gw8Zq0Ec/DkoYxoVlZdLWaGKg?=
	=?us-ascii?Q?7PwvVC1UH+CrWjF6D72WQjhPvVyQcTI0KhgsBcWITIDfa9Pxp/hwvGb2JKZK?=
	=?us-ascii?Q?ZyoySjEYoDXn+2Vb71zjr4mn5a3BvnLTEjCKa7c/OEYCKpGYPj+30Tse2Cdg?=
	=?us-ascii?Q?Cqz1MCh2NiNpe/JT8UF2qNS3hVkx9C59eDO7HSVNlFWy6rTGtl69FiCGmw4j?=
	=?us-ascii?Q?mOZ7zEdu/JT2vK2o4HF/KUBfz3Ot7xQvRcjgEa5JTxcVVT2FQYRnocAMJ2Hj?=
	=?us-ascii?Q?tzRMf/7mv1ztzQsIwv7DzGpfqu2bivry+2ywBp8Ww//HNchywTooOAEu0UeZ?=
	=?us-ascii?Q?Eyc/FWrXasmKWtbeEfpmpb6EwVX+N+AZ8/EJ5gWI+19h2yCkRQwzQPPdKsOd?=
	=?us-ascii?Q?mTYpd/cWce+DvUb6SdoiKjBddCrn15Ds/4VTDgBbaYajf8TUiAMArwjAX5Mb?=
	=?us-ascii?Q?1wL2TPeSZSXVVkGMdNKiC2QYke0aCY/LJ5op3KJKHK8tJLS97IlzM8UII7H5?=
	=?us-ascii?Q?Nyd6RnOHMtAjnBSQW6v/H6oBoRxRYM2eievojAVk6otVEB2wEWfUxEN1RICk?=
	=?us-ascii?Q?ApiZX/2yVfiapCpoG74yEg5u8NIUpYjrFlSQpvVYSutX0dWAReB1S31ZYBtq?=
	=?us-ascii?Q?GhmJwWYD1Lzm+6f6Kj85P+sjvMf/B7IMEP5u/dcx/A7/kwRYw6FYk8wBaGl6?=
	=?us-ascii?Q?91jM4m8AV3UuhKdFBc0RhUo5WM07iOMEnyXsZXjbJ2znYok7W+t7E6nYXVN1?=
	=?us-ascii?Q?kePEhmlFwX4D0ABOnTq0pE9/9NGN6m0zm6EXJ8NX1wlqm6ozmmgm4Hnqd1BN?=
	=?us-ascii?Q?gc/2iav6NsHcvVv5BUSwf5DtGVM/EMA/Sw4VMmDbHPhxjas1C8K4UC/p3mGw?=
	=?us-ascii?Q?vNAHGul2+loyT+0VN0r0QQA5z83iyf20bWJVrOXGe4htQ9Gdz4KOg98glumk?=
	=?us-ascii?Q?LXUji/aqPtvt9hcVn0QyN7nuZN71w+sz+kIwJCu0d1wv+YWi2g27z/A/8vtV?=
	=?us-ascii?Q?dRoMMqKxaIQqpWCyrFY285LlKo1JJzPOpCECBvYy3U/qVBeNVci/R/5nw5xr?=
	=?us-ascii?Q?KLh4xkLQPC7qHRen8WGsZ2ihxWtRK+VChq6P28oP8o2b08TF1CmZb26UIKB5?=
	=?us-ascii?Q?A/4R4hJ/AXYrEapwTC1Oa2OUH1N5y1HhVa5rHsz33xaLYmg/zFU+cwfK3JiB?=
	=?us-ascii?Q?r+uBVG5Bd9MIE86c/u4n/N3Fi+YwFyFjGoBQTHpDLuOm8Z56fKUqAq6tkZz0?=
	=?us-ascii?Q?NJeeDwfegkJFlkax47V2BSC2yis8tsEswst6DR9fT7TT0xc3bh38IhCkf/Ie?=
	=?us-ascii?Q?d4IBsR0f5lYWgRpTxz/XfbcYpZrsAa6z0bgHfGUJkbdvdH4T9FmJ//fg2ewt?=
	=?us-ascii?Q?n+0k0gA6+9rizztTnrcspvOvAH+Rp9BG7O2V7xsdwbSQ+Vv64yRkxIlRD44h?=
	=?us-ascii?Q?8+AHbcZy0BBqW4LJ1iDPpUh7m1ARs55lQujm/f8iuimsLsDW1CPeo3CMXvGN?=
	=?us-ascii?Q?OSpeHN4F/MLFUx/1C2QUWagLcbv4tMaby/HvyU7kpRpHNibMp97c0Ai+T2m8?=
	=?us-ascii?Q?ARqY9g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d782960e-cdfc-4d21-9ddd-08d9f2970ac9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 04:27:58.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMfvn8l7EWCZEBgzREk/AXEdWE5Sd8a236RDlFD09ouPnw1DGb7CVVAOiWzj16rKblLPd9aaSPhAs0gJn7Vo9ehrUalxARjWqcFgC/L7Fvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3879
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
	signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	spamscore=0 phishscore=0
	suspectscore=0 mlxscore=0 mlxlogscore=735 malwarescore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2202180023
X-Proofpoint-ORIG-GUID: PeGQWnfARAnOGHtT3uLaDL240LX1j5ow
X-Proofpoint-GUID: PeGQWnfARAnOGHtT3uLaDL240LX1j5ow
Cc: Jens Axboe <axboe@kernel.dk>, manoj@linux.ibm.com,
	linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	philipp.reisner@linbit.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, ukrishn@linux.ibm.com,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com,
	jinpu.wang@ionos.com, mrochs@linux.ibm.com
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

> There is a minor conflict because the __blkdev_issue_write_same
> function removed by this series is affected by the blk_next_bio calling
> convention change in the block tree, but the fixup is trivial.
>
> Martin: do you want to fix that up when applying, or do you want me
> to resend?  If you have your discard rework ready you can also send
> that now and I'll rebase on top of that.

I'll fix it up when applying. Will get this queued up tomorrow.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
