Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8398A8145
	for <lists+drbd-dev@lfdr.de>; Wed, 17 Apr 2024 12:48:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 591954203BF;
	Wed, 17 Apr 2024 12:48:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66B9442019F
	for <drbd-dev@lists.linbit.com>; Wed, 17 Apr 2024 12:48:09 +0200 (CEST)
Received: by mail-lj1-f180.google.com with SMTP id
	38308e7fff4ca-2d715638540so64673511fa.3
	for <drbd-dev@lists.linbit.com>; Wed, 17 Apr 2024 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1713350888; x=1713955688; darn=lists.linbit.com;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=pjH1m8RB2NK4WgFoKm/gKiQOqPHDLXLW5khRd72ugdg=;
	b=NUhFw1NBH8Hw6TIuvOOSTfGEDXusl/+rbE711O5K0w6iqjBVamlTvyCi6NOd8DolR1
	LELAMwGuVUuwHFXsF9rRkPjhnONrkxju6b9aHnmo/l/hra6Kx+jw60/Q0u3ls4JQHxg2
	Jso/JklnoxVg09L30P4AYlcc6ba5zPeVtENr8LMNZzkU9gra2xt2tIunk4AMZirGbZhN
	pdQgTpjJaYwctSJYWHmdwyD0xBIvQctWAyYdNdPixHjU0BmmKUaEK9L4LAPVQSV02AN/
	naZk7mPjt7ZxQL4fwdqk7wsCv6kulRv7YSl1Ew9ywc4ZMPWHgDj8rDlnJKYpbjhINBDA
	FcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1713350888; x=1713955688;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=pjH1m8RB2NK4WgFoKm/gKiQOqPHDLXLW5khRd72ugdg=;
	b=j+ztIAYi1Mm11dp0RWiUhzK5Do5aXU0tLQmd9CoqFNAZfKVUuG+RtuRqrNTchg7W7r
	dXBaSlH9/FM55RpCcIzbCFS965civkt1GbpPmA90PNl+xW3KfJPmQIToHSU2HtPMVYq2
	oyowxHHY0hL/409R1BbNfi67vbvKDxXNtGVfzq7mrmHog1VB+thbOhi6jLI3U/s4o510
	QZn3ThHamydOIhuePpRyrGtbNwCuLtDLqfXdbMLgwYb2/fHI9n9G9AXo6DOzq3LjpWhe
	g2/EtVZOcci+dGJXhmuN22TeJFEhuIh8e71Iwj4S7TsO49lZrz5xv/HGXftQXp5hYRf2
	Ezng==
X-Gm-Message-State: AOJu0Yy+ow0DPOyOcxCtRZp+36v604OqWYgWQzJRCKmcquF1un7sq0dP
	N/Q0FKs1g5EziMzE84XEm+u15O19Puz+NJZSnG/ngspAjH66vJX7go2bYyQVRqk=
X-Google-Smtp-Source: AGHT+IE8jYCzz1C1DnXoFtEwa5e1fB5yUMtoUc0p/xGZf7Br5XW9HCkZzDZLjcXKk9aTBeShreWE+w==
X-Received: by 2002:a05:651c:11:b0:2d9:fb50:5292 with SMTP id
	n17-20020a05651c001100b002d9fb505292mr10083629lja.18.1713350888439;
	Wed, 17 Apr 2024 03:48:08 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	cx13-20020a17090afd8d00b002a4b2933a7asm1110193pjb.1.2024.04.17.03.48.03
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2024 03:48:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 2/2] crm-fence-peer.9.sh: use join of node_state to judge
	whether node is banned
From: Glass Su <glass.su@suse.com>
In-Reply-To: <Zh+dFQrPLM6an2lk@grappa.linbit>
Date: Wed, 17 Apr 2024 18:47:50 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <D49E0E18-C4CC-49EF-8BB6-47C2A89BD6BC@suse.com>
References: <20240303091259.5045-1-l@damenly.org>
	<20240303091259.5045-2-l@damenly.org>
	<C2F581E6-5D15-49E7-B944-B79B3C08F252@suse.com>
	<48A9DD72-39A4-4866-B858-E50A33299CEB@suse.com>
	<Zh+dFQrPLM6an2lk@grappa.linbit>
To: Lars Ellenberg <lars.ellenberg@linbit.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
Cc: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com
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



> On Apr 17, 2024, at 17:57, Lars Ellenberg <lars.ellenberg@linbit.com> =
wrote:
>=20
> On Thu, Mar 14, 2024 at 11:18:22AM +0800, Su Yue wrote:
>>=20
>>=20
>>> On Mar 7, 2024, at 10:54, Su Yue <glass.su@suse.com> wrote:
>>>=20
>>> Hi, dear drbd folks
>>> Would you help review the patches for drbd-utils? Many thanks!
>>>=20
>> Gentle ping.
>=20
> So you apparently have some kind of test suite
> excercising this fencing handler?
>=20

Yes. SUSE does have internal tests for drbd in HA environment.
The issue of patch1 was exposed with pacemaker-2.1.7 in SLES-15SP6. =20
Patch2 was filed during debug process of the above issue. It looks like =
a=20
small mistake when the judgement was introduced.

And the patches survived in our test scenarios.

Thanks,
Su
> Thank you for making us aware, and for your patience.
> Looks plausible.
>=20
> Lars
>=20

