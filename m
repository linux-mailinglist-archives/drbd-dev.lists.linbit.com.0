Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCrwLAXKumkLcAIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:33 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 888712BEA56
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 497F1163132;
	Wed, 18 Mar 2026 16:49:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 446 seconds by postgrey-1.31 at mail19;
	Wed, 18 Mar 2026 16:39:19 CET
Received: from fhigh-a6-smtp.messagingengine.com
	(fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4DA5C160904
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 16:39:18 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E38DA1400207;
	Wed, 18 Mar 2026 11:31:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
	by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 11:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773847911;
	x=1773934311; bh=VhTfRphbBnsJvwAd3yj8HVImQRdR9MPCJ5vawPXeXdg=; b=
	fLWGErnRy0MeynlyX8TS05DxZeARPqeIErZkyhB6OLTkGa5AFFq9ovwY1nwjUhIG
	uSsiS5YvQ/X3+GuTRXsywk5YUx4PFNWGWUyNaUOjLNLKtfMb0fhAQdukVRSt0e6j
	OrwZy3bKRDRtLnWmifL1nrWnldjswOGVyRPW2H2hafrwLZT84hd29PwxnXN3UtFT
	xSzJG4phTK1DKCeGZCQVb7Q6JjBXFGvD+OED5aJbh1vS2hhIKS35ywjw3RFSbPTr
	CggzeodE7aI7NjkNaylvLXZrAlUW1iMw8roWqrOw61KKmJowlcCMyT1CxmO4EBXw
	N7S1OYM7lmCZG94MAf9R6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773847911; x=
	1773934311; bh=VhTfRphbBnsJvwAd3yj8HVImQRdR9MPCJ5vawPXeXdg=; b=a
	IMKriI1zkArgnEptsJWgS2DSoaBwOY6WCzcy+KnUlJdL5FF9NdFUYrvegv2G0tYP
	b0k7zsRMHdWpQ/Ag5bmuqZQ/LWUodKFxPYjigUTcPdSuSc/m1YFyFGGbxhrTAbuA
	L8cfDhk8MSoETZfEqXUmH9blLCIlIw9Af1uhJBz8WnS+64W552FFAbOdHE0NMNLe
	Hs+UGbJs1sEpqEMY8Tl9bypD9gzZaiD8bBY6py/WlrI9ekdiHXytJaYh6ksLoLb9
	i3K33iyvXfoz9aKy7nmgDbX2/fS2JOF9H82XqD5xD6GJEKc7hrB54bOz/WUrfquf
	NPjcc+7XWwfgBfRT2nQlg==
X-ME-Sender: <xms:Z8W6aeCadJ6iY3actVlSfAvbj_K79wOqNRk9HF6v7WfcCVKVSV9h8Q>
	<xme:Z8W6aTUF2hxeidn1xZPL956lzrewmau3YstOESs6HxH9JCIYVJiW7QptWujNaCUZz
	FTHm7UzF5ug6ZD0n7Hlie3o-SU4UnOOK34Tza0MpK7KHB37Mzb_8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdeghedtucetufdoteggodetrf
	dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
	rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
	gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
	uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
	hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
	necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
	gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
	thdprhgtphhtthhopegvsghighhgvghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
	eprgigsghovgeskhgvrhhnvghlrdgukhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghl
	rdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
	gthhhrihhsthhophhhrdgsohgvhhhmfigrlhguvghrsehlihhnsghithdrtghomhdprhgt
	phhtthhopehlrghrshdrvghllhgvnhgsvghrgheslhhinhgsihhtrdgtohhmpdhrtghpth
	htohepphhhihhlihhpphdrrhgvihhsnhgvrheslhhinhgsihhtrdgtohhmpdhrtghpthht
	ohepughrsgguqdguvghvsehlihhsthhsrdhlihhnsghithdrtghomhdprhgtphhtthhope
	hmrghrthhinhdrphgvthgvrhhsvghnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:Z8W6aep7OlOF0hFruCvLZPe7QACtElAPm3ym0pYzGyDv8zKPfXn-9A>
	<xmx:Z8W6aYdpJOBB2-Brg9hjiB7dwPJBW94YFi9NWvrwrVIAYVW3vfobgQ>
	<xmx:Z8W6aelxFUmBkpzBYeCiR7RvU9tqmyPxrc_aK6Hp99FfDHvqqWg2sw>
	<xmx:Z8W6aXYT86Wwcp2yk-6pZhrZ4k-ClTlpRB7SEb8GXJfxcxCdslvA1A>
	<xmx:Z8W6aSuJIg-RYegGBM77cR8KQ7S7lkLWn3vPGsUz7hgGviXeIgLFjm6P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 678A9700069; Wed, 18 Mar 2026 11:31:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A41OPxdFoFu7
Date: Wed, 18 Mar 2026 16:31:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	"Arnd Bergmann" <arnd@kernel.org>,
	"Philipp Reisner" <philipp.reisner@linbit.com>,
	"Lars Ellenberg" <lars.ellenberg@linbit.com>,
	"Jens Axboe" <axboe@kernel.dk>
Message-Id: <c3daa9b5-3741-4a18-9bbc-7bad1a2e0c1b@app.fastmail.com>
In-Reply-To: <eeb73048-d5ae-4fbd-9920-1395a3ca51eb@linbit.com>
References: <20260318104858.1868731-1-arnd@kernel.org>
	<eeb73048-d5ae-4fbd-9920-1395a3ca51eb@linbit.com>
Subject: Re: [PATCH 1/2] drbd: fix rdma dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [0.70 / 15.00];
	R_DKIM_REJECT(1.00)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[arndb.de : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,drbd-dev-bounces@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:ardb@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:-,messagingengine.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,drbd-dev-bounces@lists.linbit.com];
	NEURAL_SPAM(0.00)[0.393];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 888712BEA56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026, at 16:24, Christoph B=C3=B6hmwalder wrote:
> Am 18.03.26 um 11:48 schrieb Arnd Bergmann:
>
> Seems like we raced here, I already (supposedly?) fixed this on the
> drbd-next branch.

Ok, I assume that will be in linux-next

> My fix is this Kconfig:
>
> config BLK_DEV_DRBD_RDMA
> 	tristate "DRBD RDMA transport"
> 	depends on BLK_DEV_DRBD && INFINIBAND_ADDR_TRANS
> 	help
>
> 	  RDMA transport support for DRBD. This enables DRBD replication
> 	  over RDMA-capable networks for lower latency and higher throughput.
>
> 	  If unsure, say N.
>
> And then just this in the Makefile:
>
> obj-$(CONFIG_BLK_DEV_DRBD_RDMA) +=3D drbd_transport_rdma.o
>
> That should be equivalent, right?

It's close but not the same:=20

- INFINIBAND_ADDR_TRANS is a 'bool' symbol that can still be =3Dy
  when CONFIG_INFINIBAND=3Dm, so you'd still fail to build
  BLK_DEV_DRBD_RDMA. You still need a dependency on INFINIBAND
  (the tristate symbol) itself, though you probably also
  need the INFINIBAND_ADDR_TRANS one that I missed

- I incorrectly assumed from the earlier Makefile logic
  that the rdma transport exports symbols that are used
  by the common drbd code, but I now see that the opposite
  is the case. The difference is that for the case of
  BLK_DEV_DRBD=3Dy, CONFIG_INFINIBAND=3Dm, my version force-disabled
  the RDMA transport, while it should be in a loadable module.

It seems both versions are wrong then, but just adding
'depends on INFINIBAND' on top of yours should fix it.

        Arnd
