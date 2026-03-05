Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FBiJIbNqWl+FQEAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Mar 2026 19:37:58 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 32CDE2170CB
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Mar 2026 19:37:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4122B1627BA;
	Thu,  5 Mar 2026 19:37:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B41FC1630E4
	for <drbd-dev@lists.linbit.com>; Thu,  5 Mar 2026 19:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772735861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=;
	b=CsmBcR2oFryRQtYrDxxQ8V68a5F73YW5BkeZRxAVke+A7EV35CihtEkiBFM3R1GTs/A+YQ
	NSbrG1akBXX59hzvz7k+2k/AhSO6ySiSvtgp++awIjoCRF8913znbnIZC+iGqu4+pSc+HZ
	e8Omy9EFgLkrPUj7qR+g6G+EulUoETw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
	[209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
	us-mta-3-9Xd7BeH_PtG5_GIjymXttA-1; Thu, 05 Mar 2026 13:37:40 -0500
X-MC-Unique: 9Xd7BeH_PtG5_GIjymXttA-1
X-Mimecast-MFC-AGG-ID: 9Xd7BeH_PtG5_GIjymXttA_1772735858
Received: by mail-yw1-f198.google.com with SMTP id
	00721157ae682-7987861595eso148963607b3.1
	for <drbd-dev@lists.linbit.com>; Thu, 05 Mar 2026 10:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1772735858; x=1773340658;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=;
	b=tJUqIHns4GUcyQ262KWLjDwwQB83nYNqFhQpOsa8vUuWiEpKHluAZ6s6w77E+MMxbn
	3/OXDcNK/1b9H7jxcH8IJq19x1q3sKrn20kFci0FcRWr24UMSdgzVGMxMlQ1K+siSSN4
	UOpQ+1ia6FD0pMuItnO6vm32QqiEqyz8gY05Z4RrmVTnWmMlGf4aUf+5kIYYt27KVSht
	78Yv5uhyyZdNxVix8L6hQ74qbm3ZPr79x3bRteQkrcsYaRcV7PWGswQJJdy6uY3itAZX
	G8+hw8cclAdUrXa/QeNALXW0H2QI7ChxHnjlRemYlk46EbHljgInYOnELMPT3dhlxEAK
	J/Mg==
X-Forwarded-Encrypted: i=1;
	AJvYcCUtzPMcpoByN7P1YR97oDaGC1VT0v8Tw4Nx/EPuhDcHZJNiapSMX5ioTTFbKbRlciLJrayLC3S3gg==@lists.linbit.com
X-Gm-Message-State: AOJu0YyIiKAlAAqpmXDLnJ0T69zamJ+bfAsfhSiZx8lvmRup2QIziZ1/
	HIjr6yuN4j6Z5ucwiJFg/6N+JEXHL0FtCYF0Oskpv9Oj13bZmnjZRtVrXim6XR57ufGkKrIL7bv
	6tn5PNpmNJVcevqW58b16nnvmGrlwxey4nHMHTsPTdvxrDs1pkwkImZi0F+mv8Aphp32CPMyOuE
	yP/pnF2QE5sGGUaSyHqMZSPIi499Uuyo2Zxdw6
X-Gm-Gg: ATEYQzzR1Ak1x+5zoEJROGQKqB4mX4Ihz4jKyoZnZ6lOOAeBYRyqqEy/TNtZPxQQDdj
	rBqM8gzocLQbsQuA2T1MMfsd/BgA0WAPtn0EYK9vOnyc3zJnV/KOR5fp54kWHQd+yfAEfMzcWls
	4XVYkGjja8wM2k0r/N599qwP8d0q0nFKNZLaCpWKxhbYgVt8UhbvvK79328ynd1vCaaAThmnnWA
	o22z3zuvRM8bRQShPxEUbuExkoXzNvcvrhk39/Bp3V2iFIK0sRXvGBZdsXr5mUKmw==
X-Received: by 2002:a05:690c:c513:b0:798:647f:239 with SMTP id
	00721157ae682-798c6c01a87mr55056867b3.21.1772735858046; 
	Thu, 05 Mar 2026 10:37:38 -0800 (PST)
X-Received: by 2002:a05:690c:c513:b0:798:647f:239 with SMTP id
	00721157ae682-798c6c01a87mr55056657b3.21.1772735857680; Thu, 05 Mar 2026
	10:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20260304190424.291743-1-agruenba@redhat.com>
	<20260304190424.291743-5-agruenba@redhat.com>
	<aamP2qNKEmiyXQQH@infradead.org>
In-Reply-To: <aamP2qNKEmiyXQQH@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 5 Mar 2026 19:37:26 +0100
X-Gm-Features: AaiRm500QkwsYOPyC8DDeTtG7W1JPyGlNX5bDWdmiHocLDeSRR23AHcZAF5cQWI
Message-ID: <CAHc6FU5sEivMqj38xrAXuTxZ0d19LJjxbvoWtsPqm6NYigAEhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] bio: use bio_io_error more often
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xq00MQZlVHJEztGPtyShU0i-f8QP9sZhc7GHQ8BKFCk_1772735858
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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
X-Rspamd-Queue-Id: 32CDE2170CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.491];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 3:14=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:
> On Wed, Mar 04, 2026 at 08:04:09PM +0100, Andreas Gruenbacher wrote:
> > Instead of setting bio->bi_status to BLK_STS_IOERR and calling
> > bio_endio(bio), use the shorthand bio_io_error(bio).
>
> I'm a little torn how good these helpers actually are, as
> hard coding one specific type of error seems to create weird
> code and lead to bugs like the xfs one you fixed yesterday.
>
> Maybe we just need a bio_endio_status() that allows passing the
> status?

I'm not particularly attached to bio_io_error(bio); it's been around
forever but it can be confusing. Any thoughts on replacing it with a
new bio_endio_status(bio, BLK_STS_IOERR) helper instead of keeping two
mechanisms for doing the same thing?

> Also you really need to send one patch per subsystem.

I'm really trying to avoid that for simple, obviously correct,
mechanical changes that can be recreated from scratch any time.

Thanks,
Andreas

