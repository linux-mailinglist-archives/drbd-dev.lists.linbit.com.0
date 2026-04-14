Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L8tFmou3mnxogkAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Apr 2026 14:09:14 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 021F23F9CE5
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Apr 2026 14:09:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DFDA16313A;
	Tue, 14 Apr 2026 14:09:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 23F7516087D
	for <drbd-dev@lists.linbit.com>; Tue, 14 Apr 2026 14:09:02 +0200 (CEST)
Received: by mail-wm1-f43.google.com with SMTP id
	5b1f17b1804b1-488a29e6110so59902205e9.3
	for <drbd-dev@lists.linbit.com>; Tue, 14 Apr 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1776168541;
	x=1776773341; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=2dKC+bNzART0TN1K0cGjO0fj56UlUraZs5ruQszSvF0=;
	b=NcESJFElk6id2P1fIyQ7roYgIGZAfzmyBLAw7S2sBmbI1Ho8KKzpXe5NQmdcWpX48X
	tLdMW4W017tUU/33GmshWz4BjPVvmjp7vxSET5GW2qK1EMBXmOaVY0NUDeCzK5kNlRJ2
	3KN9nUjyNMVMH+M8eV0ohTZXuGStBJRADYGE2slZr2xtsDhlpjOKNVwej6XJ1WU/4QCK
	EyrHw6+MZOOZ7LEFUDQ+/OOST9SfRINB3al/K4ebIgnRNBQC59CfyCv6lty09r9/QyDN
	aAD2SHGkg779hVz+/szEniA++r5ZjGSei/a8QJBcZiWMXfLqMjPzhyo8G8M4PDHTvQkr
	ysIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1776168541; x=1776773341;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=2dKC+bNzART0TN1K0cGjO0fj56UlUraZs5ruQszSvF0=;
	b=KsSowfpYeMAc4XgIzEiSMpy3r8Tg0RQLYIvVyV8r4yyRcKODUpiJcZilBgOdp1E0ox
	0NdFFeG+w1ohmEH8tZ8QuWeKvzFeZfSdhDGlFy7ZOXFIjE+JPJ9rahnQF4fOKMjJR+Sb
	56WQ6DVEtKYCSqB6hZW+jc1oA2s79Pcf0tn7NfzRPqhrTdhgGM46APduve3sGkmomgOK
	gDIzr4/dlRGHaQFjRc2xnbDXfCoguqVoAfHwqKd3G6jwQBcGFrEfhR0tyeM7QGyKXhz1
	KicLS/N5qan+CSjIHTCvBHurtIbJKbtldBB3Bz1wqTf1bqM5He2skJYI0crtlXTwSMiW
	gYRA==
X-Forwarded-Encrypted: i=1;
	AFNElJ+VlEDDoP/ZYqUcIjquKZJuA0O/mOyMqWa2wWLFi6OGZIDeN2dsNUOSe6fWUpPFBbHPn7Ep/BVlMQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YzR+3izN3BmrDnN9Wij6GEQyv39U5aesz80LOfjW4wWjloNBCgG
	JjFnXmR1Ng2nDlvFJy0atmyIcpPN3ei5rz8nQwqNCVLzDHu/HNsF2AqMHD9vliVUyKNWZQ==
X-Gm-Gg: AeBDiesnIuiaiSRfrZzq6QzsVbEUULPy1JURzaA2q/5Fs497I1XGfP8Ko/vgUAUy2bJ
	PlEFyKeRUuQbZlXAtQANDBQS4pLk6iFBv4ZJAGIVLM4LPLSiZuZVED3d+96ECV7Qy7smlsu3C19
	GTC0ROBQ12jgILhQ9G6dXuNumfOfOt3wgxdUfpI/54kXSdopX0rwysdyyWo/uUZ43zHygUskf+o
	nQUtDEUVL0szx4Vaib0C/pyUcnNPw7PhL3Jw3HJAg6TPRmXBXE4o78KfRpNCpNiXxFVgQwI9Ugq
	U8UZSu6D1QQACEToVx40R5CB2X8dA3aUm21779i8Vwb+Epe/moDOcN73YpwBnA73uqVwpIhaJa3
	0aFPHseAL/4lEJzjv1NGk5b0duCg9R3PFPXtacJIIJiIFmSkR1/dTvnc7H7+SSP57/WhfOpmJqx
	g5ERa9YEixHhtJnQo39gaE68VvSptS4YdS2fSLcpuK2/1/6a+JwMSYlX07kl+dBMjKkx02/8hjt
	Lz62g==
X-Received: by 2002:a05:600c:a11c:b0:487:2671:fb8f with SMTP id
	5b1f17b1804b1-488d67fa40fmr168478205e9.8.1776168541312; 
	Tue, 14 Apr 2026 05:09:01 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-488ede1df12sm106112055e9.4.2026.04.14.05.08.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Apr 2026 05:09:00 -0700 (PDT)
Date: Tue, 14 Apr 2026 14:08:58 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <ad4ox7ibZoiW-tje@localhost.localdomain>
Mail-Followup-To: Jakub Kicinski <kuba@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, 
	linux-block@vger.kernel.org, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
	<20260412125502.3f8ff576@kernel.org>
	<adzVUdf74CVk2DwJ@localhost.localdomain>
	<20260413104939.5ef4d9dc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413104939.5ef4d9dc@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Donald Hunter <donald.hunter@gmail.com>,
	netdev@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	NEURAL_SPAM(0.00)[0.998];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,linbit.com,google.com,lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 021F23F9CE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:49:39AM -0700, Jakub Kicinski wrote:
>On Mon, 13 Apr 2026 13:48:32 +0200 Christoph Böhmwalder wrote:
>> >Can we just commit the code they output and leave the YNL itself be?
>> >Every single legacy family has some weird quirks the point of YNL
>> >is to get rid of them, not support them all..
>>
>> Fair enough, we could also do that. Though the question then becomes
>> whether we want to keep the YAML spec for the "drbd" family (patch 3 of
>> this series) in Documentation/.
>>
>> I would argue it makes sense to keep it around somewhere so that the old
>> family is somehow documented, but obviously that yaml file won't work
>> with the unmodified generator.
>
>To be clear (correct me if I misunderstood) it looked like we would be
>missing out on "automating" things, so extra work would still need to
>be done in the C code / manually written headers. But pure YNL (eg
>Python or Rust) client _would_ work? They could generate correct
>requests and parse responses, right?

I haven't tested this, but yes, a regular YNL client should work with
this spec. The new flags only influence kernel codegen, so a client
that doesn't know about them could still construct valid messages and
parse responses.

However, if we drop patch 2 completely, the new flags won't be in the
genetlink-legacy schema either, so schema validation would fail when
trying to generate.

>If yes, keeping it makes sense. FWIW all the specs we have for "old"
>networking families (routing etc) also don't replace any kernel code.
>They are purely to enable user space libraries in various languages.
>Whether having broad languages support for drbd or you just have one
>well known user space stack - I dunno.

Well, one of the main motivations for porting the current "drbd" family
to YNL is to get rid of the genl_magic infrastructure. We intend to add
a new modernized "drbd2" family, which will be fully YNL-based from the
start.
But we still need to support the current family via a compat path, and
I would much rather have two YNL-based families than one genl_magic and
one YNL-based. Carrying both sounds like a nightmare.

So the spec proposed in this series would never actually be used to
generate a userspace client, if that's what you're asking. We would
continue to use the current libgenl-based approach, with some userspace
compat shims to make it work with YNL. Then, when "drbd2" comes along,
we could "do things properly".

Might also be worth to mention that we are also experimenting with
Rust-based userspace utilities at the moment, so once we have "drbd2",
there will be a real benefit to having multi-language support.

So I'm fine with whichever route you want to take here, as long as
it enables us to move away from genl_magic.

If we decide to carry the "drbd" spec in-tree, that would then pretty
much only be for documentation purposes. Otherwise there would be
generated code where the spec it was generated from is non-existant,
which may be surprising.

>
>> Maybe keep it, but with a comment at the top that notes that
>> - this family is deprecated and "frozen",
>> - the spec is only for documentation purposes, and
>> - the spec doesn't work with the upstream parser?
>
>The past point needs a clarification, I guess..
