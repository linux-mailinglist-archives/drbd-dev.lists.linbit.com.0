Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA62FBA9E
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 16:02:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 758E34207F8;
	Tue, 19 Jan 2021 16:02:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C74974207E4
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 16:02:05 +0100 (CET)
Received: by mail-qt1-f170.google.com with SMTP id h19so13798850qtq.13
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vn5Y0TrG3Ui6LBbbxvYnxl2nn5t3OepGIypDVq8V4YM=;
	b=pVUDC5WiZM6Lp8yH89xT1k/YpP/3TyrwAZ15/iuWX8RBRpjlf+jFHDFgLTMtLU49SW
	kEgj71/8gTx8uUrcUqv22pjWXvmAkk4+JJZsk/LNpOAvMGyURf5ntpntikem4UAdkJmG
	qDOyNrfgyoTi6CRDwvwFDajSm8kWtjdnUlLRIqDQEpqlUC7OINwQ6kVz/aldXxJjQoP5
	MYUKt/PXULwtUE7UtG7pCk3dYIcLp50Gn7OBfoEA7a8X+HS5qin3yAo+UQVY1bXrt2Uf
	4/dAwPqazua4LeUKIitWS+j1v7XvAyJz/3HiR12eJJa0QTCjoU3WExHuF4czyxSiqnRH
	2paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vn5Y0TrG3Ui6LBbbxvYnxl2nn5t3OepGIypDVq8V4YM=;
	b=MBXT1TzIqcBq6gOk4anMad/93j3b8D4L6Ut7rwbW0ybqqqWa9P6BIr34L+f5ewcCN1
	2DnZOvXy12vqQz5jILUjbHm9swmQhsVY9v8O37nHbyDpce5ourii8ZWjgNDZbhcABnb7
	O3rZNN9z5g0j4oFrYO9x8oDBSwZ/3C/EUgeH7mgNMcoG/YGy2i/cD6tVAZUUIWz8Wta0
	2exWKfNmVK21QCBhWKh2vqZ6WTVNlNYXWxXZxJ880sghnga5/sNycqjGlfRX+q4zYN05
	XCqylCgGDqIe5L4KNRh2n3zGq5K5Nql7jNcKmG8bKQc5QPLVYm9wURQxuddART2sFU2l
	49jg==
X-Gm-Message-State: AOAM531s3nqxreq/l+XoKCKWyihKs2g8phy0UMq5W6Ky/KcQpE7WlTVn
	GoJPsY3O5MGopZb++pnq3mxPAw==
X-Google-Smtp-Source: ABdhPJw9hzTjA0HJ6VQUPwDH9drSNqii0WFZZyVd4uYqJRq1euvOSRi+J16/swjVIXriRDU/RjWmOQ==
X-Received: by 2002:ac8:6f07:: with SMTP id g7mr4493450qtv.308.1611068464463; 
	Tue, 19 Jan 2021 07:01:04 -0800 (PST)
Received: from ?IPv6:2620:10d:c0a8:11d1::117a? ([2620:10d:c091:480::1:150f])
	by smtp.gmail.com with ESMTPSA id
	w91sm6339412qte.83.2021.01.19.07.01.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Jan 2021 07:01:03 -0800 (PST)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <6eab7373-3c7f-fccf-8a6f-b02519258d23@toxicpanda.com>
Date: Tue, 19 Jan 2021 10:00:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
Content-Language: en-US
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com, efremov@linux.com,
	colyli@suse.de, tj@kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, bvanassche@acm.org, agruenba@redhat.com,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, song@kernel.org,
	philipp.reisner@linbit.com, jefflexu@linux.alibaba.com,
	rpeterso@redhat.com, lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com
Subject: Re: [Drbd-dev] [RFC PATCH 00/37] block: introduce bio_init_fields()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 1/19/21 12:05 AM, Chaitanya Kulkarni wrote:
> Hi,
> 
> This is a *compile only RFC* which adds a generic helper to initialize
> the various fields of the bio that is repeated all the places in
> file-systems, block layer, and drivers.
> 
> The new helper allows callers to initialize various members such as
> bdev, sector, private, end io callback, io priority, and write hints.
> 
> The objective of this RFC is to only start a discussion, this it not
> completely tested at all.

It would help to know what you're trying to accomplish here.  I'd echo Mike's 
comments about how it makes it annoying to update things in the future.  In 
addition, there's so many fields that I'm not going to remember what each one is 
without having to look it up, which makes it annoying to use and to review.  If 
it's simply to make sure fields are initialized then you could add debug sanity 
checks to submit_bio().  If it's to clean up duplication, well I'd argue that 
the duplication is much clearer than positional arguments in a giant function 
call.  If you are wanting to change a particular part of the bio to be 
initialized properly, like Dennis's work to make sure the bi_blkg was 
initialized at bi_bdev set time, then a more targeted patch series with a 
specific intent will be more useful and more successful.  Thanks,

Josef
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
