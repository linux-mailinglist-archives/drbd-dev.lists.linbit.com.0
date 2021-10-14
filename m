Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434F43107B
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 08:25:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 664BB420FAA;
	Mon, 18 Oct 2021 08:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B53F42002A
	for <drbd-dev@lists.linbit.com>; Thu, 14 Oct 2021 21:10:10 +0200 (CEST)
Received: from host86-155-223-151.range86-155.btcentralplus.com
	([86.155.223.151] helo=[192.168.1.65])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1mb2lr-0006Lw-DM; Thu, 14 Oct 2021 16:35:51 +0100
To: Kees Cook <keescook@chromium.org>, Dave Kleikamp <dave.kleikamp@oracle.com>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211014062844.GA25448@lst.de>
	<3AB8052D-DD45-478B-85F2-BFBEC1C7E9DF@tuxera.com>
	<a5eb3c18-deb2-6539-cc24-57e6d5d3500c@oracle.com>
	<202110140813.44C95229@keescook>
From: Wol <antlists@youngman.org.uk>
Message-ID: <e3d2f358-be1a-3413-fdb8-2e86718cde3e@youngman.org.uk>
Date: Thu, 14 Oct 2021 16:35:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <202110140813.44C95229@keescook>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 18 Oct 2021 08:25:41 +0200
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
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

On 14/10/2021 16:14, Kees Cook wrote:
>> I don't really mind bdev_size since it's analogous to i_size, but
>> bdev_nr_bytes seems good to me.

> I much prefer bdev_nr_bytes(), as "size" has no units.

Does it mean size IN bytes, or size OF A byte? :-)

Cheers,
Wol
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
