Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 824405024DE
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Apr 2022 07:51:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71D64420FD4;
	Fri, 15 Apr 2022 07:51:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB05A420FB1
	for <drbd-dev@lists.linbit.com>; Fri, 15 Apr 2022 07:51:31 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WWif4DDX+SDI4boNRQQJAfomnKYarbf5KgueLDXVi62Jn8qiem/iyYZVVIwzZBAY2FO/hUbE0/k8am+DV9NzDmK/62jv7EbQQ2xHJgZ3podJRvVcsfcthIacamMjh0+2Bys833/pVttFX6HMGCHft90NGIZC2OhBpUvOaKbEfsYIP5SuB9SFmvjX/HkDIKzPwcPJOra6bQHsHIvQYdrmzC4JcOkPp2n9L9Kzd3KW7KMgR0+4F83EsX+F5/pqcemkBoGnAJ8G4IYx8XmjDLyL/0QpisOV/dNNER9VtKUobx1HbGsLt6kX0QeeVZZ/l71OogHk3KKxynVBjLNz+dN4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=4IuTuVb/KyS1ZV0aqxRI/Yu1yD+ABTgelallVeHsTxk=;
	b=mzxXlASfNGcmJR0mr+mPSsFKifSuchQIwkCtoqenqILPlPwfVsfyJoWvV2vj3RoJPtSRpPkt9K83Ahukg5kI2JoN/Z9/8nz4/nDUQk0ZEKta6UWDAQgvMmbobzSBoamWw8jXjAwtVH/D3Uwv5jjjQNbLRI+nALtZxB0tIzvDIJ7Sx4iP+SD9GyKVI/tLMSy3gphyizEH17iVU+/oXXTAraPpBUOKqzboZDTvTbrp+3YcOcXVg0CVR2lmkVmRsXOCuXcMhwVkQgPndF7agaCW2nQRrDSmp7Sqv9tNd1qqxKW5XIEA3+6UqeV/8kYLZ70SgjJzqvpuOL5U8zGdf8fFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4IuTuVb/KyS1ZV0aqxRI/Yu1yD+ABTgelallVeHsTxk=;
	b=lx/vsdq1wuVjGXFb0RtlS8aNQVUdAwD32nu7CMFt+qyOZp4fU3BYd3nAfXUFYKskrRJfQL7Sgji53ElZm5sqH6S/Ro6ASYp2RNr5+WHyhQPl3V6ohDw/8K2T39LgGqYhL4BcILkZlIF3ghKn0878TKS0ZcvZmL9PLTjfMTSIQNzECGhofyqMeQ+XUOAPN0Q3qU8PzNiUwWiOS3ftFL8yvZ1G2R/FHpEDy1mrydwcAu2LEF+6QmWcTz3dW09SMVJheytf97BROBR4O2mgsLrGBQYZ8LvNMcZhgPtxqrDaz2MjJwXa5Np6BaGNWj9+2NWfTymrAIM8L/TicDPywpv7Gg==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29;
	Fri, 15 Apr 2022 05:36:12 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::a90b:9df2:370c:e76b]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030;
	Fri, 15 Apr 2022 05:36:12 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 01/27] target: remove an incorrect unmap zeroes data
	deduction
Thread-Index: AQHYUITCWfO5Vbexo02RhnP7B3Qt7KzwdGUA
Date: Fri, 15 Apr 2022 05:36:12 +0000
Message-ID: <673afa25-cf3f-616c-6bcd-16de35b307b2@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
	<20220415045258.199825-2-hch@lst.de>
In-Reply-To: <20220415045258.199825-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c41c8b1-f98c-4a0c-d430-08da1ea1da48
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815025F04E67817416EF431A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FFcKzlLusYcihPuQmtr3t8KbNF6ZULdsUk3VDGoPU5Bzoim7x014V7OQAcQDACuimx2k4yREtr5B6uvJ2a8+1Uhd2xpAsmFn/qLBWU+QmZXIapLZyFQRTQOeeiEfFoms7bv0O8TA2h1Sa8MwWLeGYXuS1/E3RvLIoTNRVuO9UzRcZWyZWSQFxTMOL12Qns3v9NVdUfPovTVZiFDfTwJgyfqWPItknrB6PQlFJeMVHgxGslTmq350gxs5qs+xG+OVxS/DQedOy3ltIFpHUiPwk72NY7m7PE0ZlBBrkJb3u2+zh2ymtgCOaG+bowFhrlWJOiQ1OwDOMlmF5ns3rKS8XvTN/YJYaWqL8TEOp2RpLN5OL+mrCAx8hNrBZ0paAaO92k0nRjvEM6m4d0Euaf1ZzgMt2pH+HMEHp2QtyXP9V5w9mNVIo/cpWEyM9aGG7CEQ6NufsCVtLrmceiZK+BBSOVVx6Kuriw3HemolNu69pRP3r+/ON7gJqNR9OqkQgD2pVbeubVClHb9mztUeZpd652FKmn3k9GUpqg5Fe9lm5bEDvx0Aoq1f8yqjfX3ghiHmqp6YVLYwCamze5SKJVglv1TzAO9lFIT8BZ8sXV5+npwVYd84V645TVbI7wxZVK4gtOuLWMNwXfLbt49QpuuJyb/uGDLz+jrZrlKAeP6Fj4tVN/dOdqRK/YGL4BDamm/r2o2eVfWnzC0AYh4B4aDJjdm8z4b0LqHcyk5IYJaMM56QV7Z2E1G1LDpAAKpMl5MZM530+NFxKIwbYkKX2GXdiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(71200400001)(76116006)(6486002)(54906003)(110136005)(66476007)(36756003)(66946007)(38100700002)(31696002)(316002)(64756008)(66446008)(122000001)(8676002)(83380400001)(4326008)(66556008)(86362001)(7416002)(91956017)(7406005)(5660300002)(8936002)(2906002)(53546011)(6506007)(186003)(31686004)(2616005)(38070700005)(508600001)(4744005)(6512007)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9NMHpPcWJ5Mm9hcGpGT1lSZXc4SlQ0Y1FhTUpRNUYrZjArajhyN1lGNUk3?=
	=?utf-8?B?SHM3OU5IZVNYNktNNHdzUzBGNnJjb3RVRnhzR3czakQrdWxtYlAwNTNOcUk2?=
	=?utf-8?B?c3Q1YVpZK1FoUjZ5andsZnpRbmFZUUNhb2gwek1MQkFWNld1ZFloQWRldzRw?=
	=?utf-8?B?T082RjhBTVluRDNORENwQW5lTHFOUmlNNHFhbm1QWXJySi8ydER1dFZYS0FT?=
	=?utf-8?B?YzJla20zODFTQzh0cytmNGU2eEpLTVp1YXlTYzZKUzFjSjFuYjErYWRMTHJD?=
	=?utf-8?B?cUpRa2tWaG9zYkN2QUI0dWppcnlXS29mWDd2ZUVPNjlLdmUwM0V6cUxlK2x1?=
	=?utf-8?B?ajZwRlJEWi9QQ0YvQXR6MUtRTXVoRzFMK3grcmdLSTk4WWZFVXZDbEdYZkZH?=
	=?utf-8?B?YmZuTHpuNEdCeXczMjlza1ZHS1NveU1tSVR5MkhwUUREbTRRMXdVT0FWWlFv?=
	=?utf-8?B?V29DSDdlUXZRdGZObHNMOVk1d2puWkhOWFFpY0FBUHVZTzJkNU5Wd01xL05o?=
	=?utf-8?B?SlN3a2pURnV4ZnZWRVRmVUcvU2hrK3h5ZnE2aFN2V3lRMnBJODlLaTFzWGh1?=
	=?utf-8?B?cUNCWGppN2hUWVRKTy9ManRxOGdtSFRxclFPSFh6aVh6ZnVKRURJQm9VVm9l?=
	=?utf-8?B?VnJtRWYrYkFUOTBoTmZEWXFGSHIzcVdyWk84NEZvVUNxTGdYbEllbEF5Nlpj?=
	=?utf-8?B?S2pONlQ2RnFIcE4xZDdpQkFtZmt0dUdEaWhKUWVvKzY5YmRYOXlrb3B5ZGhJ?=
	=?utf-8?B?VVpJSkZ2bWd3OXdubDdYZ0I3K25sVU4yOWQwMXFYS0ZzMjJONWtCaFpGYmRV?=
	=?utf-8?B?MThGc0Z1NVI3U2FvakFEcHplWVRqK3R4cXFLbyttR3ZtQW5zQk5wZndsc3FY?=
	=?utf-8?B?WE9PdUpwL0w4WjdMSURBNExMV1U5NUY4SjRUS0dwTXQ5TlBOT3RIUUVrTm1l?=
	=?utf-8?B?eC94djVmVHRIc1hBRTcvcUoreGlQMFpHNUVTbkR4UVRCTDQ4OFZ0Nm80L2Yy?=
	=?utf-8?B?WnRYREczdnpzRkJiK1hnQmg0cTFXUzk0L2o4dFppY0gyMElscDVtL2dNZTdu?=
	=?utf-8?B?QkUwSFNuU1VBMXhLNXNTTW82WVF0dmtZcm1BYm1iSjc4TFl2OU1sRkxTN3VM?=
	=?utf-8?B?alVrL1ZZOUF0Mm05alNiNjhKYVNZZW15T1hwTkVKWXZVcTJSUDllcFFaY29T?=
	=?utf-8?B?YkppVUFRU09lWTZWeTV4RUVDelJRbnpLbzBzbWl3NzVsenJNNGVSeDZVbE1m?=
	=?utf-8?B?N2o2MGdpNTlQOWNEazFWajFNQTVvUjlZaS9BbUZoMFJWL2JCR0pIbzJFandM?=
	=?utf-8?B?eG1WdkdKamY1ZlJwZlp2aFplbm9DeGpsY3dudWE3OUhXSm1rQ2pUcy9YcmV0?=
	=?utf-8?B?dzVUVlZNYkp3d2FtanhWcmZocHlLRW5BZ1BTMU1yTDVaWVFPb0pCL3Z6T2JD?=
	=?utf-8?B?eEx5ZE5nNVNpQ016TGI2TkYvV3VPNlBNMFFndmJ1OXI5REQ3ZE9DNVN0T1R5?=
	=?utf-8?B?cDl5WjdJNWpyaXV4cEFyUVpNTkZ5RU9hZC8rNnNVQWsyeWkvaU8vSkhOSTlQ?=
	=?utf-8?B?ajlnZDd5NHhlbUFWbm9WZ01lUGxDTDY3dTFLc3hob2locXpxWVBLYVpNNEhB?=
	=?utf-8?B?MExOaXBCU2xOeGxRMkdnU2s1ZU5vVlFQREpaRHJKVHh6M3dCdGozTUR5WTFB?=
	=?utf-8?B?UUxoSTlNM2tneVkwODlVSWNQVGpOMmpURStJVmVxYmxTUTloSjVaWUZydTlW?=
	=?utf-8?B?L0lsYS9TeVJHVExDdXpMa2tHOG5HZzJmNmxVYXMvZzlVakd1eTYveVdraC9N?=
	=?utf-8?B?UU9rSTl4VzI0OEJMUDRQS3VrY0VUSGNlbk1wcnA2VVNoc3RxNmkwSCt6WWk0?=
	=?utf-8?B?dEwrbUhnTzUvaG12YVp6bzRrMmJQWStmQ3oyTzNUYmlqbjU3dkdPZnlDWEh4?=
	=?utf-8?B?Z05maEErSG1uSzBLNTM1dEZCTmVUVVJNVUVxalVhRFFtTEdGUUdyS3ZvcXI4?=
	=?utf-8?B?OEs1VXNtWTRTd01uTzVVYXpLaU1JcU5ETTB4ZXpnZitEMDkzVTRqOXdPVjlm?=
	=?utf-8?B?YVZlTS9pWHVJV0ZzR1ZONzVrMFVlWHhOa1hvc21YSGFCZDRxSVcxeWVXSmdB?=
	=?utf-8?B?YkRyNHpEMEREdUhXWkh2Vk5pUmFoaXMrSXpqVGlYVzljMWcvZHRObnpDRjJo?=
	=?utf-8?B?cDd3YVdKMWZlNWtGYWVleFBGOW8xME9QTTJ2VzBzWGNCT013enJHOUh2dE83?=
	=?utf-8?B?WDBWWjlaUjRXU2h6TExEL1djWDdFVW1kSm14UmhLQ0VwNW1mWWNlNmd2Y0h0?=
	=?utf-8?B?d1lPQ1k5Z09rYkZ2QjNBMC9TSk0zaUExcTE2TExpdGM3Wm4vSE1oUXM5Z1dn?=
	=?utf-8?Q?3cEYgCOzwmgBAk9I=3D?=
Content-ID: <E802A778DDA3DB47923030D024586109@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c41c8b1-f98c-4a0c-d430-08da1ea1da48
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:36:12.6026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2FweSrSmTAGEteeg0PCeGV7la14HH5hz8rms25Vojja8JCsoAbp7ZNFYuPk0ZPEHv+6sDcSZkAYz2to/Dl6Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
Cc: "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] [PATCH 01/27] target: remove an incorrect unmap
 zeroes data deduction
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

On 4/14/22 21:52, Christoph Hellwig wrote:
> For block devices, the SCSI target drivers implements UNMAP as calls to
> blkdev_issue_discard, which does not guarantee zeroing just because
> Write Zeroes is supported.
> 
> Note that this does not affect the file backed path which uses
> fallocate to punch holes.
> 
> Fixes: 2237498f0b5c ("target/iblock: Convert WRITE_SAME to blkdev_issue_zeroout")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

Not a good assumption to have for sure.

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
