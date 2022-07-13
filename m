Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2257335D
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 11:46:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F47D420FAF;
	Wed, 13 Jul 2022 11:46:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 947 seconds by postgrey-1.31 at mail19;
	Wed, 13 Jul 2022 11:46:32 CEST
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF8B6420F75
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 11:46:32 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=AahHz8iM97hY8Xt8lQGJDkTrwG+Kd8Tel0tLwErH/xE6KgHLgScJzlT114qeorMt+bz0cVLrPrV59zDeVPbtJTYe0GETylgCUP7buAXhi0v8Qu4WrH3l5ADudjOyJiDB0x8xEL2R16TydTSjFiz1O94nk4V8BVrmhpwvhEYwvPDaYWUePM1lBYEib5OLqjwsJ1BJNop7mlUi1yR1fU6JW4ZvyFSCYU95DZSQ8sEVN87Sna1QXIUqTOkhcq5HTKPgNibtkV1wZyAPrlC4CjJVGrmZU4VBCIbF+sF4qCcPc73Yn+8z/A8sGmRoyISisVAO4BmQ/rWYeMDZ7Sgm/I1iKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=/F6MhqUkzvU9KVEjyqkh7M/CRI34tNCGv8dNItDByHA=;
	b=P/rqhwToQH3R6iQuIaLVOXvjej/RNZbcAY1QvINcaU7MbTIMWoyW2o8JXn75zhIwBDAwwOyv5I27QSt05SOjTKnHyLWDzG/1qZQWdz61ZxkWX/7BwLYN+6/+nK/ulCgqFrTrglNpGATASpllLyiGtW4s7UyvuYHnMgs8KGkTyccnJcDRESDwMQNC95JdfFCKOMb5cS+vR9oGfjumaN729+GLfzemjCyyCOwLORL43VsfLwi1+4MAQmxJLcnu4Q0qWRtHLKAH0F2Mn9SGEy2txIMamYgDrEHTqmQ8LGzeKqRUkIhjFu9GGHnLmRrVzAFrra8bPtK2ZyR0d0diJ4uXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/F6MhqUkzvU9KVEjyqkh7M/CRI34tNCGv8dNItDByHA=;
	b=Cv0h7IELsYpkidEv8HLwhos2TYFTExjn4bWRNGwjxIisE8FY5WU8G5za6M87Mq9fbabsbp2jsNLGUUUsim85JKDmdpgDtCR+WQKaNA+tknDt68W6CqH1sqATzCuh5vHTC/2jydwYy1hPrL+epds8KbnhKrCxqYxn0QtO0GvqHPuDJSW6ngxMtm46YmkO/7hTB3e2msrVGax2kXRhuCFXEmEWJlwY8s07GHM3wLFFo/vner3TEyc9nGGUIlL0kWPtQw0BF+UZVlFTep1uqU/eSldNt1LhDrZLCrW1y2p70+y33TCAmsUgA4Rh27VYvb6J/9lSa/8bD3GP5TxOH/r1uA==
Received: from BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
	by MW2PR12MB2363.namprd12.prod.outlook.com (2603:10b6:907:f::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25;
	Wed, 13 Jul 2022 09:30:42 +0000
Received: from BL0PR12MB4659.namprd12.prod.outlook.com
	([fe80::3cc0:2098:d2fe:5f56]) by
	BL0PR12MB4659.namprd12.prod.outlook.com
	([fe80::3cc0:2098:d2fe:5f56%7]) with mapi id 15.20.5417.026;
	Wed, 13 Jul 2022 09:30:42 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: remove bdevname
Thread-Index: AQHYlnzo+c1XXYgJvkuXancmqX9Sza18CXiA
Date: Wed, 13 Jul 2022 09:30:42 +0000
Message-ID: <2767f201-9187-209b-dfed-e3b7e23b4d2d@nvidia.com>
References: <20220713055317.1888500-1-hch@lst.de>
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
	Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 202494e2-0b85-4d81-115a-08da64b25b06
x-ms-traffictypediagnostic: MW2PR12MB2363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +YT2HulkR8++2YNVcI5H0UsbMEWNJ4qtiBLe/95H6QlC6hU+7TP6PcpXwZ5vSJ5dslzcWEDhulRRQn6JbMOjxjaknm9IYHVaJHUj5+hZVbPspguqL5OmpcCukzOiKWuFeJEkPy/kwW/sot9a2tbUP2W26vN6CGaE5XE79rt22mChAJt7URhqFrujlarYu6b089oLaO+afK4N07MDLiybSoYBOpc/xiiNpXgk3GvbCyI+0ucfm7LR45bUSh+sf0XYrtbH8rAy2aaemj8MsA9cD2S0By4oDNykBfgK+JswJluxy8UO/Cr2lwo9iCA8T1mDkjcvLY7MHZbmWP3UmPYpDkC5zK1S3b3ZlU+Expp8TeGNy697BS4rhrDMchq6Ern9/NZeCe1DzFH5V8ko77NXQEw6bpIEfCE4ZdzB+16y6LOTiWRo6baflW7ZRrrfZKnsnACE5RTVRPlgoy4zE3VZWdfWfN2XJtDJD4fYUji4FoDFawem74azmO9Qzikf20sGN8Y7Ihy4gGRZICdPYxz314B4bryS+lc5bN7mrqCmKRvagsW1t0Q1BTCF1YrZanLLM3fx3WXvqQd1SBTu0h2QdL+8eHGqVXMQnV0ehKlGBrDQNKTz+7xb2/xl04w5Iu1U6OOYydtz7uLfRIS4wDdPcOcbJbI9Lk9lwwXxn/Cei4AzQ1k1D5fVOSpiU5eUddJ+qrJIfkybbBv4ewnfWzU1PjGbUkXBMAytw34TcFRjJIvBWpzrJOuh+csBQxZZvMqO1RtlO4OkCFHUfyMSkZI5REpZ5gB4vZxGm0YyGgzQeA+CJ3Sb27ew1/tImiYaH+u0+OS2ALxHQzZpmqH/AK+iL0YX81J8gQarRQ+tjxUGen8A0Ex7Aor4dQZ8M0bQ+vG+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:BL0PR12MB4659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(186003)(8676002)(316002)(41300700001)(110136005)(478600001)(7116003)(7416002)(31686004)(53546011)(558084003)(66946007)(64756008)(38100700002)(66476007)(66446008)(2906002)(4326008)(6506007)(38070700005)(5660300002)(54906003)(31696002)(2616005)(91956017)(122000001)(86362001)(3480700007)(36756003)(8936002)(6486002)(76116006)(6512007)(71200400001)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm82eU9POXY0eHU1NmErdGlDbWlIakplU1J0eEVBbjlaY2ZTOE5tZFFPY2ZX?=
	=?utf-8?B?a3RzdmRISmlXdWsza3cxaWhZWFdiTnQxZ2I3QXZVOXR4SkkrMjJncUljR2xt?=
	=?utf-8?B?Z0cxeEdnM0draE11NG1SWi9sUDdHR2xSWWwyODMwejk1cDFCdmZicjBzaURa?=
	=?utf-8?B?RWtqRTIzTUNsVERrZDAzMnJYR2JrcXlaSGFYbEJiWjZ4bGxKbnlHakMyRk5o?=
	=?utf-8?B?RTRKcU5LYlplRnAzdlVqeTU3VFc5RHplanp3bXdpWDVMdExQalNlUzNGdFQr?=
	=?utf-8?B?c2theEx0TmRRTUhSTXJrTVpuQmd3dTRsVmZjclpDVjlWMFNsNmFqK080eE9Y?=
	=?utf-8?B?eTlaRDZWK2JHbUx0NXkvOE9YblNiZW0va2NKN1lJYmw5LzhnU2NydmV0eVFL?=
	=?utf-8?B?WFZpM0hUSmtoakhPQ294aXgrU3RTbmpiZlZ3c2ZzRkF5QTl5TVM3M0E3d0dZ?=
	=?utf-8?B?V29tdWg0L05ERk9CU3lXdmEyNm5TTHFWMXdEYUlIV3E4dUNucmNKQUVPTkp4?=
	=?utf-8?B?WjBUS0MwMnVaMmJmVlp2QmdaRHUybjRUK1pSZUV2V1RnMnZGeEdud1dhMnpr?=
	=?utf-8?B?aFdscDVWRy9tYTJsV2MyZkJZNHNkTlFqTG0wM29lUmVKbnl1UERpZnZaSEVt?=
	=?utf-8?B?dHVmbTd6QS9WdnpLT0Y5ZUhHanBqeDdhZWdkZjA2UTlWVjVkSUhqS3B2d3pZ?=
	=?utf-8?B?MUFkdVQ2d1JyRTRScExYbDViWSt1RmNSd2pYT25rRHU4WkJheHNSdC91VDB6?=
	=?utf-8?B?QitmTmE3cnZocjRJbzdheWdEWmk0RTBRMktMVEY5bis5NVdTWTFIeXB0WWhF?=
	=?utf-8?B?aGdqeGk5WmozWkp3a1pPS2svcnBVSTdscXhzZitPaUVwSDNkVnVsNDlJNkg1?=
	=?utf-8?B?SjU5UFBQUHpPNFpnOWRRbHNLdmh5OU00WXlRcWViUnNaMU1KT3Y0b0ZTWXFD?=
	=?utf-8?B?dFpBMmNpakFmVHhWOFR3bllraW41b2YxVVNSNlV4V0pEYTg3QmxLTlNRNmZH?=
	=?utf-8?B?OXZ1U29DcmowcnJOOGplRFRMMHRKYW85ZVRXV3hKZ0JqSmk0bFVUOVJYTVJq?=
	=?utf-8?B?RjNFd3FEeGpDbjUrOW91dUhVZ2s4ZEVPWWJGemNLTUJ6ZDNWOXhsTTBDSER4?=
	=?utf-8?B?K0J0bVpONHJMRWF6N2YraWU2eUlqVzdpYkQ2R09hMEJRWFJlZml0ZkxUY1No?=
	=?utf-8?B?QXFrSmpDQy9oZmMrWFNZWXVMYjI4K0dyZ2pORTVIZ1d5MHpoeXptZEw2UVZj?=
	=?utf-8?B?THZmWTJRaHdNZjEzSjk1NzIyTThzUWN6YXpXR2lhTlhmbGM0WSsrWEVmSDMr?=
	=?utf-8?B?UytvK2hTSmlpUXB0dkRuQlY0V0tRYm5RWnB4VlVzbGgyUFVFdHlrY283ZzNL?=
	=?utf-8?B?RkxVak5JYUg0NEZ6a2d5aEQwODNEdU1KZUNjMTJxcWhJZTJxU3d1eSsvd3Bm?=
	=?utf-8?B?SyttUnRIdXlQU2NFbHFmbFhNVW5kZVFWeTZ1dUFMZ3Y0eGJWM0djTDZQK0hR?=
	=?utf-8?B?MmpvcDdqUHc5SkhQUkwvVjVLWE0wN3BzMGlYUy9tVUV5YjZpOEJFWm8rcXRM?=
	=?utf-8?B?L1FGU3lJSEp4eTJlNU1SVFNUejBITnZzQURJKzhJckV1YVllVG8vaWJ4aE4w?=
	=?utf-8?B?bm9MZEg4T2VmK3BKeFpjMWhrclpqRjY2QStMcjZnZDU3Mm5WekdoNGdBWHBE?=
	=?utf-8?B?dXp5Ty80blA4NFVSblVJMmN4SjArU0pxVG5hdmdnbDM3b0w4ODlmd3R2YVYx?=
	=?utf-8?B?QjRLdHU5RXhLMURMYjd3MnRFTE9XUGxSMXhxcS9lcjkxMVNmaVpwdWdZL0FV?=
	=?utf-8?B?U3pJR3lSUGNIeGEvbjBNL2RxSng0VFBRUkNtM0V3dnZmQnc0SmU5bVZ0N0c0?=
	=?utf-8?B?ZElyZ3V5citKSWFvYXBRSnIvMXM0MEhKV2poWnJ0RlR0cDBhTTdsRUVScWo5?=
	=?utf-8?B?RFNtZjNISzhvbFVvQ2xmNlVLZFdIZmFhaXFRMjlsSFFUZnFIUzZSa29semZ4?=
	=?utf-8?B?Z2JjVGhjTW9hSXZyeHQ3SUFDVzlyY1FhOXNQdGJqV3FRWlpFZnlJYkVmcW9y?=
	=?utf-8?B?QVRSanFTNkhieFhmRzdTOXo5QkRiemRTOEV2alptV3dFZlljN1M3UjhmT2lj?=
	=?utf-8?B?SHltT09lWUluLys1b1E4cjRQSjNna1lEekVsQzFMbmUraWRKZmRnUGZ5NU1p?=
	=?utf-8?Q?CvXa0a+yI2C5kXK7gLxRZW7D59/Uk5bXTXUAY3h7fqg3?=
Content-ID: <49AB34D422258848B8AFC722A4CD9F69@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202494e2-0b85-4d81-115a-08da64b25b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 09:30:42.0270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVimavWCUorPSTruDlgMRRmwe/sGOjIY3CjwN1xz4efgJDOomQdz5+5wpDSNcDrknJm9sRo0TtebL+ObX4XtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2363
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, Song Liu <song@kernel.org>,
	Mark Fasheh <mark@fasheh.com>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Jack Wang <jinpu.wang@ionos.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] remove bdevname
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

On 7/12/2022 10:53 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes the final uses and the implementation of the bdevname()
> function.
> 

Looks good for the series :-

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
