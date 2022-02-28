Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B63464C7250
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 18:13:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 21DEA42179C;
	Mon, 28 Feb 2022 18:13:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 520 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 12:31:15 CET
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 540AA420171
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:31:15 +0100 (CET)
Received: by nautica.notk.org (Postfix, from userid 108)
	id E3E43C025; Mon, 28 Feb 2022 12:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1646047354; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzQ5VK5bfQJ50dqk23dxDjUwDDK7TA/irQD0Z9CNQKb+g550mz4220rMxu0PuRkB0
	zSH1KEphDNBJ7hKNULh8KlQjyIdBHOs8MI/nUYoPBmpLppCasulnFAsrKdaEXzwMTJ
	IwpM9+gWlHHqb/G70sMsoon8bZGjqe3igvlHvXWdB+dQG/WEtTlWyekznVAIp4LN7e
	b5pg6TDJ9pKPwGgBdsioef4sXDvyaKtcCCYy35g3YAfKpCdoJctnMsERag3cdTSjTi
	8bbBH2/ntqNttGvGikrePwX+5MLUaZ7SwFWR8e1TQHG1akbelVXWBNaL48rZXDJvyO
	7HTqyJ/PLNd5Q==
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id 6162EC009;
	Mon, 28 Feb 2022 12:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1646047353; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7ShsxTdVoGEbpDYFF27HXnsiskOzo+90fWYK/YK/pcgewcio/aI2ukKBbk8Ggf8c
	PSXNNRohBAnroHDgJmzD26WOCBS51v3CgaeWJoVRlz3gzi1Wk2c722FgVeG9ZC8Gq1
	VxeMBZJsJJ2s49Z0zkRuzCFT0FdEMmJ4Jlg8so5xUNkI1Pmhr9T77hNpqbhc5MUSIm
	Vf9CZqLUP+U5LMthWxqmxcIfa+qcI6C/HHTtBGWVbD6UPJLDQeI2MK30nqaJN3mP3G
	MxeZ4iTWnejwYcukxHfaPz9ZlYf9Zxp1r7k3O+mRBYZR8EPZsNImCl3hToWu78+1r5
	3QpJ5t/64l3TQ==
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id 8186bc45;
	Mon, 28 Feb 2022 11:22:16 +0000 (UTC)
Date: Mon, 28 Feb 2022 20:22:01 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID: <YhywWTEIY7UnCYtL@codewreck.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-7-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
X-Mailman-Approved-At: Mon, 28 Feb 2022 18:13:47 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-cifs@vger.kernel.org, kvm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	linux-block@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	tipc-discussion@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 6/6] treewide: remove check of list iterator
 against head past the loop body
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

This is a bit more work (and a lot more noise), but I'd prefer if
this were split into as many patches as there are components.

I'm not going to review the parts of the patches that don't concern me,
and if something turns out to be a problem later one (it shouldn't but
one never knows) it'll be much easier to revert or put the blame on an
individual smaller commit than on this...

With that being said, ultimately I don't care that much and will leave
that to people who do :)

Jakob Koschel wrote on Mon, Feb 28, 2022 at 12:08:22PM +0100:
>  net/9p/trans_xen.c                            | 11 +++--

This 9p change looks good to me.

Reviewed-by: Dominique Martinet <asmadeus@codewreck.org> # 9p

-- 
Dominique
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
