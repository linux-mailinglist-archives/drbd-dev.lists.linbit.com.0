Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9A4F66F2
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 19:28:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B647B420FD0;
	Wed,  6 Apr 2022 19:28:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2ECC6420FC9
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 19:28:28 +0200 (CEST)
Received: by mail-lf1-f47.google.com with SMTP id z12so5275138lfu.10
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
	b=nHoFYmIVcbUdYBuRBczLdRhO5AcYZ6GHHFtKpS9G1n5vNIpBGLipmKmQ40hQnwfBEK
	9YcCx5HGe8T4NG1UPywpqZKblDsiU8Uam6EvTYaei53mUEV7gX/X6QEIMPDVNdTe1RsC
	lSqUADllCjDlRJ3aqfDHj4gGsZ5WvTndElsOvm3ukXbURNWbOjm9tS3FKy9TW5JIte+s
	iqchodtdlLO+0839AsHapTHL+am4rmkQFqKuweIuQiuTq0iA/dxkHoEkiJl793SmXbAL
	d6FIVbXVTWtg6j4nPkHK8I7vb1+rBuBMN5T4ZVmgoa+qulAgS9/S0AV92hnwAdWJS/in
	gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
	b=QFXJ35ovNQNlu9pk5YhADLq9WITNMhWsja6ahBDexKVeVbFSkGg80sQ58J0ZDSRDJs
	x74bhUDMewS7CyLUplnEqCLv+23AQggwBaa/tt+TpOH+RLb5dgob63pfwV+28bSZqBg4
	ZHPnLn+psWs5xr5UkDDo4Shx9js1BDaA40292tZWZaYoIRQdqNIC1lnqkTmDGBbCVJiJ
	RD0eUend4l68pxhmISIIZ8DsvlhCa+HWpBLbcyeMvrQCeC+Q71OH31mZhe4Rf1wpcYQT
	yez6Cr73iRH6tYzLLRWIV1j7TmSBe8qDUl9CbogVPvGDveKn8aaFbhK0sJDeciPF3hUh
	cgVQ==
X-Gm-Message-State: AOAM532iObCY0LKYOoegF9aneufJVC++Osroxisr7k7omqp6nHrxfqWz
	2h0hvQcK6XZoERzJ693ErR1rATQM8eYeLdfZ3SA=
X-Google-Smtp-Source: ABdhPJxvT7YhfWN8QbCVz4oydCsKwT/zbXQ5089WXaSZlqzdjbFflulVc086iBmKtewP4KtbC66vp+jW8qrWjcRFTmg=
X-Received: by 2002:ac2:5f4d:0:b0:43e:da3e:4529 with SMTP id
	13-20020ac25f4d000000b0043eda3e4529mr6768924lfz.627.1649266108188;
	Wed, 06 Apr 2022 10:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-24-hch@lst.de>
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 7 Apr 2022 02:28:15 +0900
Message-ID: <CAKFNMokGOma3pvHdEsnsjuKgW+jpYX9zx8fWwJWyeKuCpKz-YQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 23/27] block: add a bdev_max_discard_sectors
	helper
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

On Wed, Apr 6, 2022 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
...
> diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
> index 16e775bcf4a7c..7d510e4231713 100644
> --- a/drivers/target/target_core_device.c
> +++ b/drivers/target/target_core_device.c
> @@ -829,9 +829,7 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
>  }
>
>  /*
> - * Check if the underlying struct block_device request_queue supports
> - * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
> - * in ATA and we need to set TPE=1

> + * Check if the underlying struct block_device request_queue supports disard.
>   */

Here was a typo:

 s/disard/discard/

On Thu, Apr 7, 2022 at 12:19 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> If I'm misreading things, could you please document that
> bdev_max_discard_sectors() != 0 implies that discard is supported?

I got the same impression.   Checking the discard support with
bdev_max_discard_sectors() != 0 seems a bit unclear than before.

Thanks,
Ryusuke Konishi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
