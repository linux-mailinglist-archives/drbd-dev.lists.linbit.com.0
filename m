Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4864C6245
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 05:56:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F4C0420323;
	Mon, 28 Feb 2022 05:56:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 547 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 05:56:38 CET
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9916B42006A
	for <drbd-dev@lists.linbit.com>;
	Mon, 28 Feb 2022 05:56:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E6CC60748;
	Mon, 28 Feb 2022 04:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FC0C340E7;
	Mon, 28 Feb 2022 04:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1646023649;
	bh=G8sG7lhMtemU8UaIfAlQyFfdM52xrPiAjoIoRCmr5pk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oGPNq6p6XPM77SHgO9aQqRI1rnuXHCc+59DXZQ1WNrGmN3OQd6S99TorBGhKumdok
	/al88n7DG2J8BkHYEPTcnC3PkoeWXPmOgtseuFvQx3PRiJwblKmCI9fhBlhdsjcaOW
	hLr6Rg6R30jUXs/Md/sM9bDGeMUMnt9uzXly3vn0=
Date: Sun, 27 Feb 2022 20:47:28 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "NeilBrown" <neilb@suse.de>
Message-Id: <20220227204728.b2eb5dd94ecc3e86912bacad@linux-foundation.org>
In-Reply-To: <164602251992.20161.9146570952337454229@noble.neil.brown.name>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
	<164447147257.23354.2801426518649016278.stgit@noble.brown>
	<20220210122440.vqth5mwsqtv6vjpq@quack3.lan>
	<164453611721.27779.1299851963795418722@noble.neil.brown.name>
	<20220224182622.n7abfey3asszyq3x@quack3.lan>
	<164602251992.20161.9146570952337454229@noble.neil.brown.name>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 02/11] MM: document and polish read-ahead
	code.
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

On Mon, 28 Feb 2022 15:28:39 +1100 "NeilBrown" <neilb@suse.de> wrote:

> When writing documentation the intent of the author is of some interest,
> but the behaviour of the code is paramount.

uh, er, ah, no.  The code describes the behaviour of the code.  The
comments are there to describe things other than the code's behaviour.
Things such as the author's intent.

Any deviation between the author's intent and the code's behaviour is
called a "bug", so it's pretty important to understand authorial
intent, no?

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
