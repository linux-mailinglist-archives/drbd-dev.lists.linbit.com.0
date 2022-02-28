Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093F4C6266
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 06:19:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A26D420323;
	Mon, 28 Feb 2022 06:19:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 77C364201F2
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 06:19:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6BD921155;
	Mon, 28 Feb 2022 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1646025575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=;
	b=1aDnYNyCMKoqi7852ELng+RjN9qj4H3oZKIs6lZKTxoiwJvkWraBZGmj+Lgr7uB+1SHFJz
	Yh2mZu17ZFxMhdj6twoLK7xeDGS6uw7JuUWs/fN+ewmZBdcdER+polBa/xGaRr74gldhFA
	Ag1t4rw/IZDJ70lWUTD3DCkE1pDKQVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1646025575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=;
	b=ETy1bbk4AvRTgoyR516RJsfNTn47d24xVl6EFjxT7PerkTAmm+E/x1KFcnx2xiTY9paC/z
	4vNKWy2UyfSPGfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E5C712FC5;
	Mon, 28 Feb 2022 05:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id 5BzICmBbHGIXfAAAMHmgww
	(envelope-from <neilb@suse.de>); Mon, 28 Feb 2022 05:19:28 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Andrew Morton" <akpm@linux-foundation.org>
In-reply-to: <20220227204728.b2eb5dd94ecc3e86912bacad@linux-foundation.org>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>,
	<164447147257.23354.2801426518649016278.stgit@noble.brown>,
	<20220210122440.vqth5mwsqtv6vjpq@quack3.lan>,
	<164453611721.27779.1299851963795418722@noble.neil.brown.name>,
	<20220224182622.n7abfey3asszyq3x@quack3.lan>,
	<164602251992.20161.9146570952337454229@noble.neil.brown.name>,
	<20220227204728.b2eb5dd94ecc3e86912bacad@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:19:24 +1100
Message-id: <164602556430.20161.5451268677064506613@noble.neil.brown.name>
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

On Mon, 28 Feb 2022, Andrew Morton wrote:
> On Mon, 28 Feb 2022 15:28:39 +1100 "NeilBrown" <neilb@suse.de> wrote:
> 
> > When writing documentation the intent of the author is of some interest,
> > but the behaviour of the code is paramount.
> 
> uh, er, ah, no.  The code describes the behaviour of the code.  The
> comments are there to describe things other than the code's behaviour.
> Things such as the author's intent.
> 
> Any deviation between the author's intent and the code's behaviour is
> called a "bug", so it's pretty important to understand authorial
> intent, no?

When the author is writing the documentation - then yes - definitely. 
When the "author" is several different people over a period of years,
then it is not even certain that there is a single unified "intent".

The author's intent is less interesting not so much because it is less
relevant, but because it is less available.

So when writing third-party post-hoc documentation, the focus has to be
on the code, though with reference to the intent to whatever extent it
is available.  Bugs then show up where the actual behaviour turns out to
be impossible to document coherently.

Thanks,
NeilBrown
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
