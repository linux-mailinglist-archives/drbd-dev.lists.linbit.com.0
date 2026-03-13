Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A+rBuogtGnahgAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Mar 2026 15:36:26 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 9A56C28518A
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Mar 2026 15:36:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B1A21627B8;
	Fri, 13 Mar 2026 15:36:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BAF79160655
	for <drbd-dev@lists.linbit.com>; Fri, 13 Mar 2026 15:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773412567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=;
	b=Y6ZXGJTi753gPM/nt0f6JeBWBlrzyg1lHgAMsAqF0v7Sta55Lk8e6juo0cVe05CGr8Uvgl
	QnoWefYh8y8bcnXi7STTlt1Lt54N+7s8z2F0ZeIyl1GwY0XhsJryiivKcb7IjuSvUodyOR
	ZKXse1NAlIHbJ+/RzUGD3844KYxCvNk=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
	[74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
	us-mta-211-eUBmtzXUPjWmdNzyPfmRiQ-1; Fri, 13 Mar 2026 10:36:06 -0400
X-MC-Unique: eUBmtzXUPjWmdNzyPfmRiQ-1
X-Mimecast-MFC-AGG-ID: eUBmtzXUPjWmdNzyPfmRiQ_1773412565
Received: by mail-yx1-f72.google.com with SMTP id
	956f58d0204a3-64ca09f2064so2251248d50.2
	for <drbd-dev@lists.linbit.com>; Fri, 13 Mar 2026 07:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773412565; x=1774017365;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=;
	b=D/po7/B+Z7FbLaM8FrTO818fHvcOx3k9rx1S40w67vz7/61etI+jGZXWRwt++X1txO
	VtJd3vGegcaP8dBdL9cJe56Ft3KFmvJNhwFQquOcVeMdpX6uKZckg0sJpoLVJXZgu0O8
	zVjledsVj2nIbgnXuP2kynrtJ0hW4ZlD4kBjSngAOeNoJrpYLlj1mv5TuCXgj3+YVxxz
	MdR2YrFpNHYJsxZbGKyU2m2Dfq8jHAP+ykyiHng/zmDhhrFAge/bIp51TaG7BES8C9+V
	dTyMgl+V8knkQxSVdAQ34ZlNYBzYANwmicF7+Yb8OkkvqjEw9oLuDU26OdeCtv6UaXGp
	fZKQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCWdyNH8suu2V2NCiCW0uZIGuo9VJV9KSz7M9AQp8FM5ONaZNLHj+DF21f406ZtYPDPAffdrxBigbg==@lists.linbit.com
X-Gm-Message-State: AOJu0YzuadTcDnObRJXSVmxYMv1LGkDua7qEigvcHcOaQ9QT1/6s5s53
	099PANhXGEEXjlH4BpFAH9gBr/CmhQdNLOOKuj1Qmj0K6+c4V8UN2NZClBT36GkNChDzdASednD
	0+wYlpGo+FTp4Uq8fGkBadis7cqTr76YnlJ1J3TOXe49sUMLiaCmTvsKrgHDEXr1MpSDSuYdy54
	cJMm0HnD1iqgKCwMf+TGo8WDfSZdmYAeY/UCsd
X-Gm-Gg: ATEYQzzLkHLvihNkMWpeTPYU32oiBVQABJ+gnewW7luZOz8sYE9X37I/rN5ZLyd6e1H
	Fonw3r5cq0W4iP62TBKuBFhR40jkm1Cdb5vQXWtcWWZWvLRgXE1msN/zD6PF4h4nqzbnmnTSUuN
	+6cDvEggtQ/cPlTPthkPiEafcbKOH3r/v8J9iy1s9VtTVBz+8WOdEflWkfZHKE7+vQ9DC9XQ+RB
	IioTFbddiZZ5uzizk2jmv/lp7WwqGKb0FC/aKdNU8aIlJ7ugd4WSLvq7NBwH75iTQ==
X-Received: by 2002:a05:690c:c1d5:b0:798:711f:a0a5 with SMTP id
	00721157ae682-79a1c10febemr31150447b3.29.1773412565250; 
	Fri, 13 Mar 2026 07:36:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d5:b0:798:711f:a0a5 with SMTP id
	00721157ae682-79a1c10febemr31150237b3.29.1773412564819; Fri, 13 Mar 2026
	07:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260304190424.291743-1-agruenba@redhat.com>
	<abQHNzJ0FR1EF0NX@shinmob>
In-Reply-To: <abQHNzJ0FR1EF0NX@shinmob>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 13 Mar 2026 15:35:53 +0100
X-Gm-Features: AaiRm50KyYlBUXDBLdnEEHXDx37wzlGjPP-UmRDDKX74QQoo2rYJKifETYROgh4
Message-ID: <CAHc6FU7bab0+snOVBog-FZkn_sy3AHoEP2SNFxdZ-n13tAE5Ng@mail.gmail.com>
Subject: Re: [PATCH 0/4] simple bio cleanups
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S5j2WE57FzVSdeMi1PMofnH2nhpYtJ0sZV7Z6TlRrZM_1773412565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <axboe@kernel.dk>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
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
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,wdc.com:email,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 9A56C28518A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 1:54=E2=80=AFPM Shinichiro Kawasaki
<shinichiro.kawasaki@wdc.com> wrote:
> On Mar 04, 2026 / 20:04, Andreas Gruenbacher wrote:
> > Jens,
> >
> > here are some simple bio related cleanups.  Any thoughts?  Can those go
> > in via your tree?
> >
> > Thanks,
> > Andreas
> >
> > Andreas Gruenbacher (4):
> >   block: consecutive blk_status_t error codes
> >   block: get rid of blk_status_to_{errno,str} inconsistency
> >   bio: rename bio_chain arguments
> >   bio: use bio_io_error more often
>
> Hello Andreas, during blktests CI trial runs, I noticed that this patch s=
eries
> triggered failures of three blktests test cases: scsi/004, scsi/007 and
> throtl/004. Do you see which patch triggered these failures?

Hello Shinichiro,

thanks a lot for the report. I now see that patch "block: get rid of
blk_status_to_{errno,str} inconsistency" is broken in its current
form.

Andreas

>
>
> scsi/004 (ensure repeated TASK SET FULL results in EIO on timing out comm=
and) [failed]
>     runtime    ...  3.855s
>     --- tests/scsi/004.out      2026-03-12 15:23:54.664435639 +0000
>     +++ /home/fedora/blktests/results/nodev/scsi/004.out.bad    2026-03-1=
2 18:13:40.059747989 +0000
>     @@ -1,3 +1,2 @@
>      Running scsi/004
>     -Input/output error
>      Test complete
>
> scsi/007 (Trigger the SCSI error handler)                    [failed]
>     runtime    ...  115.385s
>     --- tests/scsi/007.out      2026-03-12 15:23:54.668435644 +0000
>     +++ /home/fedora/blktests/results/nodev/scsi/007.out.bad    2026-03-1=
2 18:15:55.054944537 +0000
>     @@ -1,3 +1,3 @@
>      Running scsi/007
>     -Reading from scsi_debug failed
>     +Reading from scsi_debug succeeded
>      Test complete
>
> throtl/004 (nullb) (delete disk while IO is throttled)       [failed]
>     runtime    ...  1.643s
>     --- tests/throtl/004.out    2026-03-12 15:23:54.710435695 +0000
>     +++ /home/fedora/blktests/results/nodev_nullb/throtl/004.out.bad    2=
026-03-12 18:20:46.314368581 +0000
>     @@ -1,3 +1,2 @@
>      Running throtl/004
>     -Input/output error
>      Test complete
>

