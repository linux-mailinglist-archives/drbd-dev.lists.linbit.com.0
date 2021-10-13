Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB842B74A
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:31:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAB44420FFA;
	Wed, 13 Oct 2021 08:31:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A45942002F
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:31:04 +0200 (CEST)
Received: by mail-pl1-f177.google.com with SMTP id c4so1114468pls.6
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=IqFCee932yXff3g8S22IMIonv/32fuT5szLU0pggDNY=;
	b=a1xXRGShMNUcH1NESAktZXUgL3mFc7wQIYKmmv8/Y/ALepXHOWmmTvT8XSj6vOg/M+
	MbhM/ene3FaZLDFtmRSFfGBcWZN2IWLJwqUk7lw7SQibDKaQXujif5Kg826b1uwy92rp
	BE9pd9q6ethHDDGyjRig6Cy//vFmfRqzEgWkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=IqFCee932yXff3g8S22IMIonv/32fuT5szLU0pggDNY=;
	b=MMrRbG8MxYf0Izc2e/SvwfNjtF01Ot3r+u6f6k8eVFTmdVuEZtl3SCxDUPzdJMZDFj
	NUsycMNCsGoGH29Zw+GSAnvOfS3gTAhwDp7dDBNmecaURXDC5kNF5k6fMu8yUwWCmO4I
	iW9Bhu8EVIj4ZrmDiCHBG6sq1r/qVtni2vh+yB0ZD68rKlzFlOI+qlFZxDGdYMwnADB8
	U2RfGwlDQvgbGcEy+Ae7WEn5wk48Ezv+5IGoA8mtFrFWbfO1hBzvoFi18okEj8XkgqDG
	iCBVTBrm0cvxQP4hi0wi4tREJo1h3osk9SRQz3yg+mmPMRuOJhnaacy5iP6JEeP6Qoni
	zgeA==
X-Gm-Message-State: AOAM5309iSwvv/HQSC+9dBZP6+ttM1oVzk79WOHsBG3FsiL7szTp6oeV
	+4DfO/qmb2EJvJAq5zhRKjzKwQ==
X-Google-Smtp-Source: ABdhPJzPpkxK9ZnBKhTayH/eUQdncp8qkTzuStqH3wv1NooRt0u8SlJ26bmKBvTPalBAv9kwTDH0GQ==
X-Received: by 2002:a17:902:f683:b0:13f:a79:52de with SMTP id
	l3-20020a170902f68300b0013f0a7952demr32121054plg.43.1634106664061;
	Tue, 12 Oct 2021 23:31:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	k6sm13945349pfg.18.2021.10.12.23.31.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:31:03 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:31:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122331.C020EA7@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-27-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-27-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 26/29] jfs: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:39AM +0200, Christoph Hellwig wrote:
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
