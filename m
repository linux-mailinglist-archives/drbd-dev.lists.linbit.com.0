Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9942D4C2
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Oct 2021 10:25:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F1FB42100F;
	Thu, 14 Oct 2021 10:25:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 468 seconds by postgrey-1.31 at mail19;
	Wed, 13 Oct 2021 21:44:58 CEST
Received: from p3plwbeout09-01.prod.phx3.secureserver.net
	(p3plsmtp09-01-2.prod.phx3.secureserver.net [97.74.135.162])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EFACD420FFC
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 21:44:58 +0200 (CEST)
Received: from mailex.mailcore.me ([94.136.40.141]) by :WBEOUT: with ESMTP
	id ak3omG16znSe7ak3pmBGYH; Wed, 13 Oct 2021 12:37:09 -0700
X-CMAE-Analysis: v=2.4 cv=FuXAQ0nq c=1 sm=1 tr=0 ts=61673565
	a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
	a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=8gfv0ekSlNoA:10 a=FXvPX3liAAAA:8
	a=Tqnnkb1RH65CB2acoZsA:9 a=QEXdDO2ut3YA:10 a=SM4aVyO6fsoA:10
	a=UxLD5KG5Eu0A:10 a=OunuuIp3J4_2X_e7vt2U:22 a=fDQtvUcBV1mJc6yKnRhE:22
	a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: ak3omG16znSe7
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
	helo=[192.168.178.33])
	by smtp01.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1mak3n-0001YR-Im; Wed, 13 Oct 2021 20:37:07 +0100
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-23-hch@lst.de>
From: Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <cbd3585f-87c6-ab31-2911-4d3550287e22@squashfs.org.uk>
Date: Wed, 13 Oct 2021 20:37:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-23-hch@lst.de>
Content-Language: en-GB
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfE/iZ/pfZZKYsr3IbqO0C9si77HNsJfm+Id87llKwVqG9Is3lLJ4EGZDxxbaW11qc8N9SyDa7OI6yd2yYLWXfLqDj9x0awW5xNuTjndLBI79eJng4tnO
	bdld2RuUvfBQeCIAUmUxyvcculfRuU+GLdNDl2dVddzLPB+dmIVGzi5CRjdfSfeCeJAKXEqKoQQ7RshoF9uEY3KBGjlEdAfMEaU=
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:25:15 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 22/29] squashfs: use bdev_nr_sectors instead
 of open coding it
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

On 13/10/2021 06:10, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Phillip Lougher <phillip@squashfs.org.uk>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
