Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29E42F977
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:59:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ABC70421086;
	Fri, 15 Oct 2021 18:59:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2A62942106F
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:59:37 +0200 (CEST)
Received: by mail-pg1-f173.google.com with SMTP id j190so2385121pgd.0
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=KeY5Iupdn4Pa1b1ywzkz23CB7y+Fa3Cfufu6RZZIPYI=;
	b=VfHpzO3tYcRdDu0YlVkKzx/ciItoc9jkR356sB11SejVmPNb6TbARwblxJNv77Pw+N
	f8l5X6Xk6dZ16M5aIo4oyfynzDADoHwHbbl+nEWOg/Hpm3DtdjVVH1S12Q1eI7nmyOz6
	dWXhnsHrWbhYXafHG9GJqGCTKk1oPJdLtiQOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KeY5Iupdn4Pa1b1ywzkz23CB7y+Fa3Cfufu6RZZIPYI=;
	b=3EQ9yhyTM7JyzqafnT9qyWzYS2Jac2BSnLaxQ2TzZLScJFUm7ERGlOF4KU/d1J++S+
	RU3P2f0FOLEjvafL2iFS0lEwmS4CtCRZc0bbaAHF9hawQd41b8tjBmwlVQAuvlnldkxb
	dJL7bpb9DqZrnATk+IzWRj46Qe0Gy+mpfZokL+eV7Cmx3/Ojbe154L7Ck+a2RfssnVhD
	OApemsgurRwABwH7g0+GZTdqb9LGHo1UHJTAuk8HodaoFjFfitqTo8ME6CgIHSOu1KYM
	cYiHveAlHr6DSLdybt12JPYyrjDZ3E81raZ4KY/0dSfeCb7krVB/gwwdxb8UL309GmPR
	TtjA==
X-Gm-Message-State: AOAM533a1buAF//NRAy7QuCwtVFAKv9c52/WDBFsqqEu6a0o9va5xdLF
	domfrMgyR96PGj5t9sGC8HZCLw==
X-Google-Smtp-Source: ABdhPJyZcIPxqI061aZSIz4/wOG8MIjCzx1/IGr1O74KMeY0yclhOMeVn1PfQJDWXy+egSNKM0RvAw==
X-Received: by 2002:a62:1bd2:0:b0:44c:db2e:5a88 with SMTP id
	b201-20020a621bd2000000b0044cdb2e5a88mr13192615pfb.29.1634317177017;
	Fri, 15 Oct 2021 09:59:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	t38sm1001799pfg.102.2021.10.15.09.59.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:59:35 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:59:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150959.D3A3EBD2DD@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-13-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net,
	Anand Jain <anand.jain@oracle.com>, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 12/30] btrfs: use bdev_nr_bytes instead of
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

On Fri, Oct 15, 2021 at 03:26:25PM +0200, Christoph Hellwig wrote:
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
