Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15D307B8D
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 18:00:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 709944202F8;
	Thu, 28 Jan 2021 18:00:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 391 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 08:28:20 CET
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1590D420807
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818900; x=1643354900;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=Fou+4cLJrSCon50d9/Y3lLiRTfP/NjMtM08GVarOK2I=;
	b=O+4WfzTQl2SqovCBK01PujZCc0lw9gBdmCt83P1S97pMuOPX5fZZKeIQ
	FEuusbf5M4nRLAFOSbW4octFVfhWWnibKHvMyR/XLipVN52uUAr6WZOPD
	gGb8DnaZVsxAsYtr02T7LofHNTbUQeHjIpDagsqnYS2oozfXOIqGMqzUH
	XrQzSQhc4RzaK73a+OkF2XGbOf2D2eHwCSPfKeB4fBFQzt0zOww7pn/pS
	vKD9q/cSfdvF9bxXAo3RU5wFNtC6YYDX9FBBrhpAd6xvTAEXrE+6TiChq
	EGeo47gBgOkpsm8gGCxnMcMEaA3IbFC2ZN3jz6TWCPaaZLNiTa5E8u3qQ A==;
IronPort-SDR: 1XO4jceGpXsh5IubGHdLerxe4aeG9SxsSlvvinyZ7xz57Mp/Yn2xXzprrhv/lGRMw7sD89FT+6
	0aDVxAiCPzDc65NGiWOiKo5gxtNSPZKz5mlSA/25VzwvVnfoogtEwKBkNuupemZT6VWxmBVgoz
	1kutj7VUKXVePpFPNy7xf0zdg+eN3kJwPBnQ3H0UcYQsyPV+WI7edJnh+Tc18j4bolIOp7HUx9
	V4l3St9H+gnv0HQImdqL8myuAw+VCjktcivp9mOSzOLzABQ8HsgpcL3yN2K451BrUxmzcCQRu1
	NX8=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518130"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:25:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mPdcK/wrqdrll5sSKfk/tpq+HKxGIlQ0olUV0quQ8r2P/3nkAWU1JEEJynwYK81uPBXyiVe8P/0ReiX0vWx1ysl3aPlfWX/zWMKqDpP3Q5OUw49avJXJH2gTxuUGjO1ciVP4bhrZgRGcJvgcVGiWfncxPWNr4BpcNlSKmoScyPyxO+CsrdP/WJneJ6H0ickT2bAe8XRmNbNkCDwsfGyW0Z0LbNI+jh0D89leTmSOwyP/lyte+GTjeNnQuv3TwgkY8ipQuG5F0C6TnV/hLz2zC8MxcG19vCz2vtGsbqAPOIHDQ1zaNzys+NQGoUOAO83YzvMc1YgQqq42Ugx4+leh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jSgQdFikue5ip6XRlyXPzYKx1++P+Hg8uK52x5aYL+k=;
	b=KUUNYeeXKSAbS8LV+b7WXja6brRVaKoFOOm0ujkmkWuJSLPzgus7drFwpT6L7Ot2K4uRF84HiOSSRTJ/a1vz14uMNSrmk+D9cmd4fog2uuZkq8Bg4yioVRqhjkmTj95TPpunAFyXu7wrfwI+6bUToQUict0wo7eAxK2IKlx9ih/NNFUjYgwBtAu2Gc9hsgJ9vjHItWNsy/YUwdnRsmPGo4+Lx7RcpvBVDiWHK/y4ptKzFiztsD/lV909+yhlv4jzL9U/PMYvvQ46Zlbx5vG6kL0q+Dd7XlcNgHHYYN46v11y9UnCCpJz2FcBxuVohCL+wb9/1zfcSBwhN80oplJPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jSgQdFikue5ip6XRlyXPzYKx1++P+Hg8uK52x5aYL+k=;
	b=rcbJ6C+1HneLHXguaze5yHNT9VQb6QapqfT7ZimwMdiRf3BlXyrrVQzYvksAWPAeoLwphxgKl+Ck4KCZdN4IwAGa0P2CQi+y7tYyl6GXouJAwGOKdgkHPFo+1nz9iVrAnlGohUMWpVVVahoBL3AsByBgHK6QGOwRfTqnebimXv0=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
	by BL0PR04MB4852.namprd04.prod.outlook.com (2603:10b6:208:59::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15;
	Thu, 28 Jan 2021 07:25:08 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
	([fe80::b880:19d5:c7fe:329d]) by
	BL0PR04MB6514.namprd04.prod.outlook.com
	([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3784.017;
	Thu, 28 Jan 2021 07:25:08 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "drbd-dev@lists.linbit.com"
	<drbd-dev@lists.linbit.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "target-devel@vger.kernel.org"
	<target-devel@vger.kernel.org>, "linux-fscrypt@vger.kernel.org"
	<linux-fscrypt@vger.kernel.org>, "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, "linux-nilfs@vger.kernel.org"
	<linux-nilfs@vger.kernel.org>, "ocfs2-devel@oss.oracle.com"
	<ocfs2-devel@oss.oracle.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Thread-Topic: [RFC PATCH 28/34] zonefs: use bio_new
Thread-Index: AQHW9UVkomvF2vpeIk+EkJoBWTZvag==
Date: Thu, 28 Jan 2021 07:25:08 +0000
Message-ID: <BL0PR04MB651467E7A7C6EA542A435DC6E7BA9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-29-chaitanya.kulkarni@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
	header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:47a:7b5a:7dfa:1b1e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 571a2e12-0985-48c6-3f9d-08d8c35dd761
x-ms-traffictypediagnostic: BL0PR04MB4852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB48526F818C0FABCE58FE358FE7BA9@BL0PR04MB4852.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 32W9x/cXloQ/0z7DAt7qSsx7G7lrDFeZKKnz06uUAgqmQA0gT3PPCEyknGB3ASTcaW8hMZsSv7e4qBntNlXUHbZ8XUAGPoKPUEg8L3NUMI7uFcJfpKllkC7jh907tv13wKROCFhzy3qIjUrr1qvxVNJbHg4AnaAu7Hd0n9BSJd6ltHb+lx6Kt1Bn0OufCV7+r+cTwGKhQjCwuKOs+4ysKSQ8sW8+mt0qxyYFn2M/rNCmGKkhY8zImLX2a4W554RAzTEia6eb4MM87+6pBC8w1Q2HNfvRcd39MixEiA1EUbkbySsl2l7XWBYBO5mzIk9WQ9arSlUleijKB3OzhzhTK6LyklxSc45/PlQXclMCdkFEDXw4Ertp1VGxUdGU8cRWvDhZS9EfEEXCIfXImgIiA9tufLH1CjNO2bVvXzP6PLtxkgtk9qCm5MMg8XrWcy13k6zxpm3w4mC4P9lE98bhvznAFUhPPMQYCtcaqGBVD8wVrEEVpyd7b42fgd6EvLNMLYC9H3silifIWz/Rg5TpNU9zXgVikI9bgP+aoGCiEFisN+if7JaPfhP5VriRPmet
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(186003)(66476007)(83380400001)(53546011)(5660300002)(66446008)(316002)(8676002)(71200400001)(66556008)(91956017)(86362001)(64756008)(6506007)(2906002)(66946007)(52536014)(7366002)(7406005)(9686003)(33656002)(110136005)(7416002)(55016002)(54906003)(4326008)(76116006)(7696005)(921005)(8936002)(478600001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KUYSxjXYfQyNkYu8LxobzslWgbRrh1Hl0zsXUUsbHOAiFNIp1CHkc7Nx0P0Z?=
	=?us-ascii?Q?86/TnX/TPZp6t3X6c/g7GjztYvohIOlICO4H8k7mNeR7y+CZ3BtbwC7PEo6W?=
	=?us-ascii?Q?HqJHIyObHou2BiSclkZegmCnVRenHuoXxGl5D73K00V1VymVtpakkO57xYsU?=
	=?us-ascii?Q?Ck0cY+BcGGROkuC2MoyqtVOpp/iltPkRzE6GJ9wDOX1598WYiKIvr2y+YmQ+?=
	=?us-ascii?Q?wQwbQRUTninVVh6zv6CkTTAfZTBHB090EUDht5aK+Fo6z/eRCqrS4IlOCGFq?=
	=?us-ascii?Q?498LbIthUnE3rks5RvI2V2xbSQzfsFQhY5vova5SXPsbG/TiZr8HjDcdE2oW?=
	=?us-ascii?Q?8BGJ9GFuH2UrnBhdHujwELLdv6L1T/WlR5cJq/tiDhld5tUhYHzFjjWvNE6c?=
	=?us-ascii?Q?I+VXBTmaxLP14RoKqfP5otrWi3wLf4bycUl7pkHG2CaWA7+0Ez531fX8rOvT?=
	=?us-ascii?Q?cwBmQi02GfJo21WpVkvrl8s38CKqH8j5qJewOxErbbHe0iDj02o7T820Cxzj?=
	=?us-ascii?Q?xCnk763l4wH0f6+ovzE1ZlF3iE7LNGxHlBwqoKcf39VHXx7/AAy1GrT22ApX?=
	=?us-ascii?Q?MgPXcNJ0iSVZtFkZFzM73MhFM1bOuiOO7NGIY/4aAWcEdzhZflqdsD+WsBkL?=
	=?us-ascii?Q?yp43gtW33O9bJEtWIvPn6iuK2yQ3bsRg283jdRUh6QLEtjciruqLGthtvhIy?=
	=?us-ascii?Q?s+Qcu4k/NE4d2HrVekBg/BxoUQUacAxI3FQJlsyVGEJY20k7Q9k0OMh9tvCp?=
	=?us-ascii?Q?qtaZtRNzfpvdZXte5TfUlQMxq5WV2WBBQqcSz1ND4HWP/deex/dHdrNwRKlk?=
	=?us-ascii?Q?djYJIdTki4xpkR5Xk97EgRFyZ8k35H0GsnLJuHCvt6gVnkwWsZ+ztFnhpOd/?=
	=?us-ascii?Q?Y0xM6YlGj/6zQRgzmDTOlwzdb/zAxqF+vxvcQn6Fv/iysP57q5ld+v5t6054?=
	=?us-ascii?Q?LtNzFHBIocUBaYhhkclP8GsmoPTepXiqTfUXqM+B+fDDX1DL9mTRkt9y9Qak?=
	=?us-ascii?Q?Nh8TG/F+F4jszRp6q+6wcfEuAiihnLxXxfrviLvmh8gYVfagv93E5lxVVktd?=
	=?us-ascii?Q?hXXp0Bqmg9I+K4jbZwyXDH49F3B4s9kYdbA1Xhg2QrjeOTNP7nU4t9UFW+4p?=
	=?us-ascii?Q?Jw/JubtNhiONkVlxC0ibXm51hfwOkfGG6g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571a2e12-0985-48c6-3f9d-08d8c35dd761
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 07:25:08.3693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2LVRo+jq8H43Yomo5AbZnE8GRpz0qPYcTtqFQS+Wx0lj+olf9/bMCZK+x9/8XOA2sWiiRbuHCzb/zC8+GMypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4852
X-Mailman-Approved-At: Thu, 28 Jan 2021 18:00:21 +0100
Cc: "shaggy@kernel.org" <shaggy@kernel.org>,
	"sergey.senozhatsky.work@gmail.com" <sergey.senozhatsky.work@gmail.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"len.brown@intel.com" <len.brown@intel.com>,
	"tiwai@suse.de" <tiwai@suse.de>, "djwong@kernel.org" <djwong@kernel.org>,
	"gustavoars@kernel.org" <gustavoars@kernel.org>,
	"joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"alex.shi@linux.alibaba.com" <alex.shi@linux.alibaba.com>,
	"hch@lst.de" <hch@lst.de>, "agk@redhat.com" <agk@redhat.com>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "mark@fasheh.com" <mark@fasheh.com>,
	"osandov@fb.com" <osandov@fb.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"ngupta@vflare.org" <ngupta@vflare.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"hare@suse.de" <hare@suse.de>, "ming.lei@redhat.com" <ming.lei@redhat.com>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"jefflexu@linux.alibaba.com" <jefflexu@linux.alibaba.com>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "jth@kernel.org" <jth@kernel.org>,
	"tytso@mit.edu" <tytso@mit.edu>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"rjw@rjwysocki.net" <rjw@rjwysocki.net>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"minchan@kernel.org" <minchan@kernel.org>, "tj@kernel.org" <tj@kernel.org>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>,
	"asml.silence@gmail.com" <asml.silence@gmail.com>,
	"jlbec@evilplan.org" <jlbec@evilplan.org>
Subject: Re: [Drbd-dev] [RFC PATCH 28/34] zonefs: use bio_new
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

On 2021/01/28 16:15, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  fs/zonefs/super.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index ab68e27bb322..620d67965a22 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -661,6 +661,7 @@ static const struct iomap_dio_ops zonefs_write_dio_ops = {
>  
>  static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>  {
> +	unsigned int op = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;

I do not see the point of adding this variable since it is used only for the
bio_new() call. Pass the op value directly.

>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	struct zonefs_inode_info *zi = ZONEFS_I(inode);
>  	struct block_device *bdev = inode->i_sb->s_bdev;
> @@ -678,15 +679,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>  	if (!nr_pages)
>  		return 0;
>  
> -	bio = bio_alloc(GFP_NOFS, nr_pages);
> +	bio = bio_new(bdev, zi->i_zsector, op, 0, GFP_NOFS, nr_pages);
>  	if (!bio)
>  		return -ENOMEM;
>  
> -	bio_set_dev(bio, bdev);
> -	bio->bi_iter.bi_sector = zi->i_zsector;
>  	bio->bi_write_hint = iocb->ki_hint;
>  	bio->bi_ioprio = iocb->ki_ioprio;
> -	bio->bi_opf = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
>  	if (iocb->ki_flags & IOCB_DSYNC)
>  		bio->bi_opf |= REQ_FUA;
>  
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
