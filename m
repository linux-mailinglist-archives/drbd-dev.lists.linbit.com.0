Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE742B67E
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:10:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0010420FEA;
	Wed, 13 Oct 2021 08:10:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A9096420FDF
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:10:12 +0200 (CEST)
Received: by mail-pl1-f181.google.com with SMTP id w14so1092899pll.2
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=HKDYpp4YSVsNULamooLUjhsr3ltG6/c66elTMRrkKgQ=;
	b=NoF0hG29o29DKsntYKpCXV92mD6h6EMom48z8tQzSN8FHu905ky+Xz3bE0nNtk4PY1
	0HNqwx/qtRzx7vXjuatnB9t9z2CQvezADG+ChrPjw5Rsdx9XyUR9gAFLAQnuxS6pqLaj
	euLxlv/sHfBVUNSEFnk9jxaM9RIcQ1jZpnz4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=HKDYpp4YSVsNULamooLUjhsr3ltG6/c66elTMRrkKgQ=;
	b=ImCUKZfij4RZ7mubKO4h8i6evyN0gFln/BE+1VHpQ489/Ogicxd9JsxJkJxOMyMuNx
	wlFl8GwYz3dh1pAX93+saOJrcXHmB+00KbdaqDXZJdeFqzxOPf4pxurA5PJUYmYVwqAl
	0QqKv5UtStHxezyJHCFZ7Qo1b5njn693XLvH5KBJ9wMD7Hr5pTXRJaNf8wwm0novmicy
	LMxPCHPuPKfZBbO1wZrx2esJ3zcfe4bdPwfSW5F8vDS4nN6NxP7ncuGEEzD2TmR7b26G
	B+9AebRp367RFkUmDbwp4mUqEfHmYd0QhQihQNNT4CqaeJmlSl74ZTrntY8f2ster9rA
	9SGQ==
X-Gm-Message-State: AOAM530qo5lgWBPUcmL7UVl0lDuh3sD3MaHayWhvMZ5nRL+GSb0vnwXy
	loW+DEp/LakqGAbc58y8Iec+qw==
X-Google-Smtp-Source: ABdhPJyI6aPzBzGRPPEaJuKfUq0XfZkLrckDtvce+rfY8Gu3TkNHDTrcv1RgahLv6GETviOJpuuK3w==
X-Received: by 2002:a17:902:f691:b0:13f:2034:7613 with SMTP id
	l17-20020a170902f69100b0013f20347613mr24197069plg.81.1634105411698;
	Tue, 12 Oct 2021 23:10:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	z24sm5259621pfr.141.2021.10.12.23.10.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:10:11 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:10:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122310.36F4C08@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-4-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 03/29] dm: use bdev_nr_sectors instead of
	open coding it
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

On Wed, Oct 13, 2021 at 07:10:16AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
