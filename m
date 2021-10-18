Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13A43247C
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 19:16:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B3E32420FF2;
	Mon, 18 Oct 2021 19:16:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9EFDB42000A
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 19:16:11 +0200 (CEST)
Received: by mail-io1-f43.google.com with SMTP id d125so17165821iof.5
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TVetvWb4+B/byEt0HFTw7Li/1VctyD/QgsPHbsid4H8=;
	b=rkRLnHg1S4u8HX11jOSUsmgOu279172YT/qIHLznH/jwI1IdjUhSA0m6I5uyrdNBJQ
	GZpTrNqHq3BbgsfYzCH0RiwOG+GG3HdSbaxtt1+taUjeE/o2nf0qjkZ23LPZL14mgyVx
	r5QceDW/MeG8za7F5qhNzSKPR2x7wRt1a8B5T995CSTZ1u9OS6Ch+FzWEBtUbHpcq9AQ
	KUlG6PBJnMhvawvbI3ONNOa5vJZRKzg+iSpti1pyNyehN+8MHnCAxM/sIrViilbzyvRG
	Q5nXCXvu4cEFPGfCltmsbNSsOl86kwWVB1XaqYHb9cyqB+54s92TMxyv7jKS0YWyf0KL
	kSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TVetvWb4+B/byEt0HFTw7Li/1VctyD/QgsPHbsid4H8=;
	b=6BMuRNJi8huPHkr8XJSc2Ts/2wKZHX5DziICzf3CwwapBTJMhCCL6u+Iq+dNESBIBg
	DSqRhh4mZsr942agEQcRMsX1LzjnQcTHuIKd5M13AJSwy5adq0ukY8JSthbhcmXhn7nZ
	Z5MJ4oG4g2sdFEuJ9pAUTFNJnB5rycKV5CFrmoWAVUEne8HU28YYKRQV70nkxXoT/XK9
	jRs1+ZJ8QNlP5y0uj0j7YXSzHrbbBJpqjrEzcPoyYZRVO5FuqXYkTBXY9mT1BRwi8Rlp
	lhtwmwIraC3Fk4CCcBmKgOP5DAW1WJFMyObRaQSlLcTEp/It4MeVeU+vkmy5jQM6OKwg
	rKFg==
X-Gm-Message-State: AOAM5339liDHiE6XVQgy0Wb3O+mFJxHIQDf8uaXFggzqJaZkzZXB5eWj
	KyWx4AzKukIWWwE+qYaiVqcnSg==
X-Google-Smtp-Source: ABdhPJz+RKspHd19wACUssDbTNQ6NJRkN4g7OdL6jX2ni5qwlHyFbIbt1tgTl8EVs5WghyoBxus9iA==
X-Received: by 2002:a02:ac8a:: with SMTP id x10mr745552jan.43.1634577370548;
	Mon, 18 Oct 2021 10:16:10 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	u12sm7081225ioc.33.2021.10.18.10.16.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 18 Oct 2021 10:16:09 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20211018101130.1838532-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
Date: Mon, 18 Oct 2021 11:16:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211018101130.1838532-1-hch@lst.de>
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

On 10/18/21 4:11 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> various drivers currently poke directy at the block device inode, which
> is a bit of a mess.  This series cleans up the places that read the
> block device size to use the proper helpers.  I have separate patches
> for many of the other bd_inode uses, but this series is already big
> enough as-is,

This looks good to me. Followup question, as it's related - I've got a
hacky patch that caches the inode size in the bdev:

https://git.kernel.dk/cgit/linux-block/commit/?h=perf-wip&id=c754951eb7193258c35a574bd1ccccb7c4946ee4

so we don't have to dip into the inode itself for the fast path. While
it's obviously not something being proposed for inclusion right now, is
there a world in which we can make something like that work?

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
