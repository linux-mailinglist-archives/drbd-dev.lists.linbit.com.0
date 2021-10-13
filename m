Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4B42B726
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:29:43 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C016420FE5;
	Wed, 13 Oct 2021 08:29:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 97A83420004
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:29:41 +0200 (CEST)
Received: by mail-pl1-f171.google.com with SMTP id v20so1107345plo.7
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=W+Po2ncML0dagir1ZXD2ovXOKvk/W+c/3o5vm+NA9cQ=;
	b=QomLyJ/uwXmEgOIdGiIKpgwe7fIN3sqRRqysUR703Xs3YgTlXaMfe2P+HII9dJHv27
	pe85K+wWKdH0PewpBtncrX+pK9/vv2ewnDdpNrXhC91Xk/Ncvs9CyiBnb8qEmm15S3FV
	6BEJ5rXVDozZ1lv8jDs3uSJtiPb9Dk/ZAAcM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=W+Po2ncML0dagir1ZXD2ovXOKvk/W+c/3o5vm+NA9cQ=;
	b=uIVgW88UaGF7C6/ncjw6gPCRqqyoMPZM5y3wN0NMiFnD1iK1a8byf6vPdEmdHPBGqZ
	5JCPWhA91oY8FMy6my0i+7J+1lrT8UiHwLj6WNZxLEQ4GZsfX0+zWdpo1oNrsN2vK+vC
	B5uyDJxNwdRxoXAfRxWjtS479KiEZuf/Z1AcDQCFXdl3tIMaQFSQZFcMweEnzzDbuNo3
	S5wx/Gz/ZLwB2HQI1nI82yZv8NR66/0y3GQcZTNI1/ln5Hyim4strNoMYtTdnP6w9ByK
	O39KZyPVkCFVxMoDqBwBP+5qVHUThRytYAkfVS3pmiBa6SXEtwvfkwN6fp1p4c8l0Xi4
	Oc0w==
X-Gm-Message-State: AOAM533ju+jQ3b+E9mJnDLpXnCgyvf0PF3TsjvQg2kSEhmVYN4cN+9tk
	cMDX17PbVb7JNuVCnyyv2Daipg==
X-Google-Smtp-Source: ABdhPJwwvDzOMlBdl8uBpL682Y/M/U5HFlms6OXsU9pvWhVrOJHosSbnvoIECvMOshQ6rTYdsLz56g==
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
	mi12mr11492173pjb.57.1634106580411; 
	Tue, 12 Oct 2021 23:29:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	x7sm12999948pfj.28.2021.10.12.23.29.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:29:39 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:29:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122328.92B4FC41F4@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-26-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 25/29] ext4: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:38AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 0775950ee84e3..3dde8be5df490 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4468,7 +4468,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto cantfind_ext4;
>  
>  	/* check blocks count against device size */
> -	blocks_count = sb->s_bdev->bd_inode->i_size >> sb->s_blocksize_bits;
> +	blocks_count = sb_bdev_nr_blocks(sb);

Is s_blocksize_bits always 9 here? If not, this isn't equivalent.

-Kees

>  	if (blocks_count && ext4_blocks_count(es) > blocks_count) {
>  		ext4_msg(sb, KERN_WARNING, "bad geometry: block count %llu "
>  		       "exceeds size of device (%llu blocks)",
> -- 
> 2.30.2
> 

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
