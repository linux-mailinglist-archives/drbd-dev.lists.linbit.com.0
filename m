Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136543107E
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 08:25:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DDE48420FC1;
	Mon, 18 Oct 2021 08:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgw-01.mpynet.fi (mgw-01.mpynet.fi [82.197.21.90])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2849B420FFE
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 16:35:59 +0200 (CEST)
Received: from pps.filterd (mgw-01.mpynet.fi [127.0.0.1])
	by mgw-01.mpynet.fi (8.16.0.43/8.16.0.43) with SMTP id 19FEWINE065735; 
	Fri, 15 Oct 2021 17:35:41 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
	by mgw-01.mpynet.fi with ESMTP id 3bqa6fr1mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 15 Oct 2021 17:35:41 +0300
Received: from tuxera-exch.ad.tuxera.com (10.20.48.11) by
	tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server
	(TLS) id 15.0.1497.23; Fri, 15 Oct 2021 17:35:40 +0300
Received: from tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789]) by
	tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789%12]) with mapi id
	15.00.1497.023; Fri, 15 Oct 2021 17:35:40 +0300
From: Anton Altaparmakov <anton@tuxera.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 28/30] ntfs: use sb_bdev_nr_blocks
Thread-Index: AQHXwch+sOYTA5n1EU2k5d07nGAE/6vT7f2A
Date: Fri, 15 Oct 2021 14:35:40 +0000
Message-ID: <7644804B-2081-4A1E-A40D-9A5C7BF72E2E@tuxera.com>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-29-hch@lst.de>
In-Reply-To: <20211015132643.1621913-29-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [109.154.241.177]
Content-ID: <3668CC17B52D274985AE4DAF6C11620E@ex13.tuxera.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 4ZKrI-UQqOuYdNTfa7YqNKQX-GuzVYXg
X-Proofpoint-GUID: 4ZKrI-UQqOuYdNTfa7YqNKQX-GuzVYXg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
	definitions=2021-10-15_04:2021-10-14,
	2021-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=mpy_notspam policy=mpy score=0 phishscore=0
	mlxlogscore=999
	bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2109230001 definitions=main-2110150089
X-Mailman-Approved-At: Mon, 18 Oct 2021 08:25:41 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>, Jan Kara <jack@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] [PATCH 28/30] ntfs: use sb_bdev_nr_blocks
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

Hi Christoph,

Looks good, thank you.

Best regards,

	Anton

> On 15 Oct 2021, at 14:26, Christoph Hellwig <hch@lst.de> wrote:
> 
> Use the sb_bdev_nr_blocks helper instead of open coding it and clean up
> ntfs_fill_super a bit by moving an assignment a little earlier that has
> no negative side effects.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Anton Altaparmakov <anton@tuxera.com>

> ---
> fs/ntfs/super.c | 8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 0d7e948cb29c9..5ae8de09b271b 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2772,13 +2772,12 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
> 	ntfs_debug("Set device block size to %i bytes (block size bits %i).",
> 			blocksize, sb->s_blocksize_bits);
> 	/* Determine the size of the device in units of block_size bytes. */
> -	if (!i_size_read(sb->s_bdev->bd_inode)) {
> +	vol->nr_blocks = sb_bdev_nr_blocks(sb);
> +	if (!vol->nr_blocks) {
> 		if (!silent)
> 			ntfs_error(sb, "Unable to determine device size.");
> 		goto err_out_now;
> 	}
> -	vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -			sb->s_blocksize_bits;
> 	/* Read the boot sector and return unlocked buffer head to it. */
> 	if (!(bh = read_ntfs_boot_sector(sb, silent))) {
> 		if (!silent)
> @@ -2816,8 +2815,7 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
> 			goto err_out_now;
> 		}
> 		BUG_ON(blocksize != sb->s_blocksize);
> -		vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -				sb->s_blocksize_bits;
> +		vol->nr_blocks = sb_bdev_nr_blocks(sb);
> 		ntfs_debug("Changed device block size to %i bytes (block size "
> 				"bits %i) to match volume sector size.",
> 				blocksize, sb->s_blocksize_bits);
> -- 
> 2.30.2
> 



-- 
Anton Altaparmakov <anton at tuxera.com> (replace at with @)
Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
Linux NTFS maintainer

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
