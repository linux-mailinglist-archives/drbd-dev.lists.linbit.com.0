Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6BB43252D
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 19:40:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3BFCC421002;
	Mon, 18 Oct 2021 19:40:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 47CAD420FFE
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 19:40:54 +0200 (CEST)
Received: by mail-il1-f182.google.com with SMTP id i11so15704512ila.12
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8eHyIh60ZUzo3JWH2PHiHe4cTmG/UJai+TUUoRo1bPo=;
	b=FxDre2hjyoHZ64BANF3MmORptiQUy9H6AZXx6LsuyaBb3BcaZC0U/QrU21BtTujGBo
	8pKXev+INoMpwpLRfH86fYXpprj4xYaVKSen9V7xFxUy/Adi3YagOWpZv1TCL1fYRKF4
	KJjdISFmhkQQ0L4EmrQXCfcR5w3Zzj3aqn6DzOl13eefz8vxGa1vYg1bewxzJ9VB28da
	3UiILqBGRheOtvSI5gJ9xtk7xHUS/Gucotz2TgqyyRfnlasGRztSAeszEgY1u2mV13ER
	EMsST0UXfQiH71wz4IGsonA4VDgwXa5gnJGRFiHsgHIEksPy/aZTeVCzAUrIhmXl9xQs
	p/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8eHyIh60ZUzo3JWH2PHiHe4cTmG/UJai+TUUoRo1bPo=;
	b=kM+GayDW1mSpf5vYSkre3zOQxndgSCeTvgROAtw4Nj1NR4GlK8LnzPNAOOYe4sUQUw
	2RxmkEiHuC3ROs0LTu14AEN4uti2bRjRWRYmaoqczRgcQ71snzNRrWoPM3hhbebseYCw
	e3uPnBpk4wlhFKeTyACQhY3BOsf3wIU+1YvpZVIBkOM5wAYcb9Ss+8saBognbFCkQr+l
	EPyxQA9UKfg7FXigrgMLEmP6yC/yExXDMg9aHS+lt73IETDQLOTB0NsdO98oTCqfq710
	J7PpK9d7NTsqCZdhDzvrf3sUKG7toVYKb34P8h5wWWrdemBmIGtaOvD291awjWL2zPhw
	ozNA==
X-Gm-Message-State: AOAM531u9fxGpAVuh5zEjB6fT56vJx2v3/AfRxMu6ruxM3z1YVasKdbp
	IQ37WxdfKde19KBbX+7ii1QxkA==
X-Google-Smtp-Source: ABdhPJwRrr1OSerCMeedIq2RIL4WChs1nkzMA+HxEg+LQORSp5DecggK+ro0hO8CL+NowqI2hdNiZw==
X-Received: by 2002:a05:6e02:14d3:: with SMTP id
	o19mr15105521ilk.257.1634578853304; 
	Mon, 18 Oct 2021 10:40:53 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id s6sm3131684ilv.18.2021.10.18.10.40.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 18 Oct 2021 10:40:52 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20211018101130.1838532-1-hch@lst.de>
	<4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
	<20211018171843.GA3338@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2f5dcf79-8419-45ff-c27c-68d43242ccfe@kernel.dk>
Date: Mon, 18 Oct 2021 11:40:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211018171843.GA3338@lst.de>
Content-Language: en-US
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
	v3
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

On 10/18/21 11:18 AM, Christoph Hellwig wrote:
> On Mon, Oct 18, 2021 at 11:16:08AM -0600, Jens Axboe wrote:
>> This looks good to me. Followup question, as it's related - I've got a
>> hacky patch that caches the inode size in the bdev:
>>
>> https://git.kernel.dk/cgit/linux-block/commit/?h=perf-wip&id=c754951eb7193258c35a574bd1ccccb7c4946ee4
>>
>> so we don't have to dip into the inode itself for the fast path. While
>> it's obviously not something being proposed for inclusion right now, is
>> there a world in which we can make something like that work?
> 
> There's just two places that update i_size for block devices:
> set_capacity and bdev_set_nr_sectors.  So you just need to update
> bd_nr_sectors there and you're done.

This on top of your patches should do the trick, then.


commit eebb7c5048163985fb21d6cb740ebac78cb46051
Author: Jens Axboe <axboe@kernel.dk>
Date:   Mon Oct 18 11:39:45 2021 -0600

    block: cache inode size in bdev
    
    Reading the inode size brings in a new cacheline for IO submit, and
    it's in the hot path being checked for every single IO. When doing
    millions of IOs per core per second, this is noticeable overhead.
    
    Cache the nr_sectors in the bdev itself.
    
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/block/genhd.c b/block/genhd.c
index 759bc06810f8..53495e3391e3 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -58,6 +58,7 @@ void set_capacity(struct gendisk *disk, sector_t sectors)
 
 	spin_lock(&bdev->bd_size_lock);
 	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
+	bdev->bd_nr_sectors = sectors;
 	spin_unlock(&bdev->bd_size_lock);
 }
 EXPORT_SYMBOL(set_capacity);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 9dbddc355b40..66ef9bc6d6a1 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -91,6 +91,7 @@ static void bdev_set_nr_sectors(struct block_device *bdev, sector_t sectors)
 {
 	spin_lock(&bdev->bd_size_lock);
 	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
+	bdev->bd_nr_sectors = sectors;
 	spin_unlock(&bdev->bd_size_lock);
 }
 
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 472e55e0e94f..fe065c394fff 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -39,6 +39,7 @@ struct bio_crypt_ctx;
 
 struct block_device {
 	sector_t		bd_start_sect;
+	sector_t		bd_nr_sectors;
 	struct disk_stats __percpu *bd_stats;
 	unsigned long		bd_stamp;
 	bool			bd_read_only;	/* read-only policy */
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 7b0326661a1e..001f617f82da 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -238,7 +238,7 @@ static inline sector_t get_start_sect(struct block_device *bdev)
 
 static inline loff_t bdev_nr_bytes(struct block_device *bdev)
 {
-	return i_size_read(bdev->bd_inode);
+	return bdev->bd_nr_sectors;
 }
 
 static inline sector_t bdev_nr_sectors(struct block_device *bdev)

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
