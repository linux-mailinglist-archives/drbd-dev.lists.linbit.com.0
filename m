Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 864452DB491
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Dec 2020 20:39:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6AB8F42061C;
	Tue, 15 Dec 2020 20:39:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 458AC420372
	for <drbd-dev@lists.linbit.com>; Tue, 15 Dec 2020 20:39:36 +0100 (CET)
Received: by mail-ot1-f52.google.com with SMTP id h18so20574542otq.12
	for <drbd-dev@lists.linbit.com>; Tue, 15 Dec 2020 11:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=3b7nYkNlLaPVEYu3ZA/n7veczrs1x5sAvjZGNcxhh/c=;
	b=FyeOzQh/WrUo52Lr638Z0ffiyKLVAVWoNKBbjYOwhYwHZl/Sc1KSyGsDraVvpU1gcQ
	NdPekuB04+NcU4WtJsYm0ETY5mwbITeAwB5C5IRmggLQWs/eJwMfhYjaMUewqqsTuaAc
	DsLzLtvpy8MXl4oIQ92uMR+ePrKTJfcPjBH7ogGWXBWdzseqMZcGzECLFIODoUuIzSD/
	1v8CeaXHGhMU4kdLsE6FIr7TlqV2uyEeSBof7ypsg1LScPoFV1VyH/J59NN1azxU5Mpq
	7R7QqsCsH0NwtZBQddWtJ4QqOtRE6XV9g2lsKnNqBCc52Zu5/Hxk6ZHVwisFeK//OMSW
	t5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=3b7nYkNlLaPVEYu3ZA/n7veczrs1x5sAvjZGNcxhh/c=;
	b=sS+NTGkbSuA4DBlPZ9pNGoMOrqmh5Nefc4TRjdRdRw7j87UYd8jv69ihP8iRaFc39D
	EtBWhrW9z7wpxxf6kZfAV0FHdAPvS3TPkfeFT1YZHLR5mnP5cWvVNnipl+GbM+YpoYp+
	PEgUWHb/eFdz547SU+y/y079/z4ZaUATjlK6nGHN2HNg+dfTgkA5UN4OyD+lIxDjj1sY
	jgIDHFyBNkRfeEOFPt+CXzfvXjLZhlnlLRY/kVPepAYmufy+wexyuK3nC6RxiH0vwK59
	cQLNxlTbwgsZzfDIELKexgO3Ryrzx1VNjru+pSNMFvfl5OCFMoTH21voUaR2S8iD4qqg
	UNYA==
X-Gm-Message-State: AOAM531M2u6oBrNc7Eph0Eks0m2toaEvITmPeasvy6Ct8t9rXy5h44jW
	KczhmreeOBj7bVpDDb/AGesdk/F9ql1x2spxwxlIM6+NFhA=
X-Google-Smtp-Source: ABdhPJzPa98aQHNQe8PN5Mmq01CoTyRMy/9jpgo9rEjj0rkK+psuc5oim0BQUjJ7ChUGvVKWumgaTKQpBXCiCArVSic=
X-Received: by 2002:a05:6830:23bb:: with SMTP id
	m27mr24859963ots.198.1608061175699; 
	Tue, 15 Dec 2020 11:39:35 -0800 (PST)
MIME-Version: 1.0
References: <CAOQxz3ztdjxt+7ock3q6+kMRgYAwY3h10K8xOY0hHrijt+MfcA@mail.gmail.com>
In-Reply-To: <CAOQxz3ztdjxt+7ock3q6+kMRgYAwY3h10K8xOY0hHrijt+MfcA@mail.gmail.com>
From: Michael Labriola <michael.d.labriola@gmail.com>
Date: Tue, 15 Dec 2020 14:39:23 -0500
Message-ID: <CAOQxz3weoma13ua-dRcRYvecf5OdTw6F-hTHABfGLtQFJ+VepQ@mail.gmail.com>
To: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] problems connecting with mix of 9.0.26-rc3, 9.0.24-1,
	and 9.0.25-1
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

On Mon, Dec 14, 2020 at 10:36 AM Michael Labriola
<michael.d.labriola@gmail.com> wrote:
>
> I just tried upgrading 1 node of a 3 node cluster to 9.0.26-rc3 (w/ patches for 5.10 kernel support).  The other two nodes are running 9.0.24-1 and 9.0.25-1.  The upgraded node comes up w/out any noticeable complaints, but stays in Connecting forever.  Switching that node back to 9.0.25-1 connects instantly.
>
*snip*
>
> Anyone seeing this kind of thing with the latest rc?
>

FYI, I'm happy to report that this problem is fixed in rc4.  I've got
working DRBD devices w/ the 5.10.1 kernel.  I'll go beat on it and see
if anything else breaks.  :-)

-- 
Michael D Labriola
21 Rip Van Winkle Cir
Warwick, RI 02886
401-316-9844 (cell)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
