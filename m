Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF542B769
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:34:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA2D3420FFE;
	Wed, 13 Oct 2021 08:34:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A695E42002F
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:34:11 +0200 (CEST)
Received: by mail-pj1-f52.google.com with SMTP id oa4so1419780pjb.2
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
	b=AvobKbPMrQUDEUEp6fPFubcGItxc/wnKkqnDSAjF2JOJIzD6GaHgOkeTfLVH2dVkY7
	athTU5gaBp9pQ5+vN8pGXUoM6NXB9m94GmbcWoYtzrCupD5haSLJb51jgUAYN2bie92y
	Cw/fWMm7nAHe57gHGr8VcvjTAn4+/uHsWTDDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
	b=II6sXJp6bjoF+vh3HYqfeRWcxoVkzL+Qt9+ndLBEcOOyyMTLDAtwKA4/GBHkjnlYfJ
	VPeg3xeC5HsBU5Zk51TGwYe6n7wpIdyaZ2WzC6SwW9P9P1kAj57alg2Wv+GRD3mgpav9
	+KnCScb7wim1XhjECKmM9eD+t0GqTCcMbEUsXK6TyxgVTKe0CsM8BhDvgYV1xqF/71G6
	jRFfoCrXWN2XXOixIejtuv65jFwDyR9h6BMPdrntnV9QtOCbw8cAZHvUeKaqI3xIMxyk
	oq1EjxDnCeooav7KX02cS/Hy1LomlRT4XZDD4e3v66gZRvEfgtSenRPphRZACYC7qtzl
	rFRA==
X-Gm-Message-State: AOAM533krXlhzVxm6w7EPLbwvbViBsYITP4+/lAuq2BAQn+qe3KAGSb4
	AMegieYkkOseHprIBn5oHJzxJw==
X-Google-Smtp-Source: ABdhPJyCtmPDTqSGxs9iwHCnitZ1F86E6zXvgsm3yviJEZQtBzg0xs5Q4LZVn9iTvPOonDA6xdZ1cg==
X-Received: by 2002:a17:902:f683:b0:13f:2fbe:498f with SMTP id
	l3-20020a170902f68300b0013f2fbe498fmr18917273plg.17.1634106850602;
	Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	t3sm13004045pfb.100.2021.10.12.23.34.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:34:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122334.7A3E933D@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-30-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 29/29] udf: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:42AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
