Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H+EOh4Ix2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:43:42 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id B5A6034C14D
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:43:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6E00163146;
	Fri, 27 Mar 2026 23:43:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 513 seconds by postgrey-1.31 at mail19;
	Wed, 18 Mar 2026 22:29:45 CET
Received: from fhigh-b1-smtp.messagingengine.com
	(fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A9FDE162774
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 22:29:45 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 17EEA7A0064;
	Wed, 18 Mar 2026 17:21:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
	by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 17:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773868869;
	x=1773955269; bh=ODM0+NlCmd227tQSIaLYBvFz9hHEuOY9El1401vnkJ4=; b=
	WGhmxX7RD9FvaVIKlEIcx3YUmzxqDTrdQ2HCPiHMsGakOgyv4+iovpx2VB6NJkTZ
	gFaMGYC9YofPst+CDXROqZV3ulKj6neOr+5TU1JAWJI6ejYSIiqdDgqGa9dCBbc1
	GOwyiWjQYbjC6F9NyUVwsuYEUUZfEx8ACAQQrNY+oxZ6IGMVJUZUtkVX/Y4HvaSg
	c1qOcaioOVU6GAY+kWAojzWQIwqrEN2Vor5Bel0J0rqoKv8kBVjwFsUC13EGGr6S
	aFJipFVambqyAi+pFslaS7u2qU3Ef1yPpAvs5xhu64C7EFwm7wEjsHj9JNpoJ+QY
	omvcTqZvZx1VjBLnYWTIrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773868869; x=
	1773955269; bh=ODM0+NlCmd227tQSIaLYBvFz9hHEuOY9El1401vnkJ4=; b=W
	tmIJHtVmfHplGg22RKeDjLKm+dZ18u/XvAMV2msJk6WBGmgODgGkQYDRUJAdOsCM
	iOlEpkfRPCFukB7lbyFqKFGDuPWvpUiZnIcKLElO/qBHVZUVK7dojqORVr1niigL
	A3ktAhFwhkCxCjFwKqcrFkCK0uolaeUDJREOhYAESXt4nTMv4nrtZKBcfwnktxsO
	HpA8pgPK7Ef6c6zsdsZQpBZNRoSpnTzrRc3+Wl3A5pJ8UY0JY3HqhzprMKIzF7yv
	WIEDjhrE9SkBZrvRh/n7Q9M0nArQxccavlj5UuQMV+mZuvxd3yQXoUoymVZ+vj90
	cIHOE2H0ghhF+ACZsxOKQ==
X-ME-Sender: <xms:RRe7abEG--WR-k1gpJhHjLg4ncccfRaj_Ct_TKMq4fQJLuv3I-FDSw>
	<xme:RRe7aTKzn_iEHPhy1_1vC1fXpxElqYkHbpTmlVb18JekV0PRX3HjpCggRBVqaTRaZ
	onnbeCSl3GJZcAFLswuaTyuzykLkONHgdDUcU7m8opSimIZGEUr453W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdehvddtucetufdoteggodetrf
	dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
	rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
	gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
	uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
	hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
	necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
	gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhu
	thdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoh
	epvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopegvughumhgriigv
	thesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgigsghovgeskhgvrhhnvghlrdgukh
	dprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhorhhm
	sheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
	dprhgtphhtthhopegthhhrihhsthhophhhrdgsohgvhhhmfigrlhguvghrsehlihhnsghi
	thdrtghomhdprhgtphhtthhopehlrghrshdrvghllhgvnhgsvghrgheslhhinhgsihhtrd
	gtohhm
X-ME-Proxy: <xmx:RRe7aX9dkAzfKFipLbIteNXrKPA6e6DDby9VWTh3epMv6QF5bWT2fw>
	<xmx:RRe7abS4Hbfk36L9FAskc9gAo1Ir7-gteJ4TdJfxuacdyTarnW9C9g>
	<xmx:RRe7aUpnNCRn1YGPSc5g6Lyq726c2Tb8PpPrWpquFgUksYUZTJ_hgg>
	<xmx:RRe7aQPWB5cOYDOZY0IKbkGeg76ABvxrb2r07FZ2kfQ5nnjJ8LMu4w>
	<xmx:RRe7aTM60KNALgXhuGbXnBvuNKqtnkW__RaGaPuGkV5W0NxYIVnSHVSl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62429700069; Wed, 18 Mar 2026 17:21:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AaEtqGFuZtnN
Date: Wed, 18 Mar 2026 22:20:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	"Arnd Bergmann" <arnd@kernel.org>,
	"Philipp Reisner" <philipp.reisner@linbit.com>,
	"Lars Ellenberg" <lars.ellenberg@linbit.com>,
	"Jens Axboe" <axboe@kernel.dk>, "David S . Miller" <davem@davemloft.net>,
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>
Message-Id: <74946481-4eb7-4d8d-b10a-881ebd84ee33@app.fastmail.com>
In-Reply-To: <6b696861-ac39-4a87-a2fa-ad47a75031c6@linbit.com>
References: <20260318104858.1868731-1-arnd@kernel.org>
	<20260318104858.1868731-2-arnd@kernel.org>
	<6b696861-ac39-4a87-a2fa-ad47a75031c6@linbit.com>
Subject: Re: [PATCH 2/2] drbd: select CONFIG_NET_HANDSHAKE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 27 Mar 2026 23:43:37 +0100
Cc: Eric Biggers <ebiggers@google.com>, Netdev <netdev@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Simon Horman <horms@kernel.org>, drbd-dev@lists.linbit.com
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
	DATE_IN_PAST(1.00)[217];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[arndb.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:ebiggers@google.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:horms@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,drbd-dev-bounces@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.998];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: B5A6034C14D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026, at 22:16, Christoph B=C3=B6hmwalder wrote:
> Am 18.03.26 um 11:48 schrieb Arnd Bergmann:

>>  config NET_HANDSHAKE_KUNIT_TEST
>>  	tristate "KUnit tests for the handshake upcall mechanism" if !KUNIT=
_ALL_TESTS
>
> Thanks for the fix, I applied it to our drbd-next tree (which should e=
nd
> up in linux-next).
>
> I would prefer to squash these kinds of fixups to keep the history in
> our patch series clean.
> Arnd, does that work for you? How do you prefer we handle attribution?
>
> Unfortunately I couldn't really find a clear precedence pattern for
> this, how is this usually handled?

Whichever way works best for you. Some people care a lot about=20
attribution for bugfixes, but I generally prefer a clean history
myself.

     Arnd
