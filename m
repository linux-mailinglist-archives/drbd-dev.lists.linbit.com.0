Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6E510A4
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2019 17:35:49 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C80A1028A6F;
	Mon, 24 Jun 2019 17:35:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 358181011BFF
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 17:35:45 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id r16so14377339wrl.11
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=1uPEVJ/4RytjFwkvTatfYPqfiYridYkZtYtLB1+3yaU=;
	b=fMnymthh8ey/hcGXuh9BuaJIZfIH7R9YhoNF0UOuFIkQvTyvdhCIyLP5tIjsTqECD4
	Ab2hdVfYsHk6sVRzq/dtal4Lo6YInzUloX7ptKGdnKRkR7XyGhG82UakEffW0+CJxrLA
	bYYpsH7C6Qpg6m4Oeo4KHKqEIZGg1wOJ+dcIfqnz7743E9P1L40FI4hOT9ac3qAJdCRV
	Scmu1Qa6uibkEBSvPyCiQK8DD3+Odoz36FAWjOQ8TdJVFe8b4roklu17yG4gR0GR2PwZ
	tGdJ3Hwqt+lh8sM4fqWEsDDedzIQeXAJoLNt4xWZmcFYqutsddmWPqEfHONcueMvCLFy
	qbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=1uPEVJ/4RytjFwkvTatfYPqfiYridYkZtYtLB1+3yaU=;
	b=QigKS/wli6Pr84MorM2qyMrLd62+MqX3WNtnGViqL27cJihsbYx64J7yu6ZghBnoWK
	IlC92e/zQcwVAxD370i8D5p1Y//s+Idt8AYxmFJHiom1CFfbzYYBcDjCcESmJJvTAYST
	4bbR2DQxjOJdd9lvCOPD35S1HejWhSIrkkxNoEb/xfazn6U5Hof7ZQ0n4MKJ5W58ekFd
	JY6oY1TlsdIlCyn8Bf34OSQvSG5cMf0OEYrRwN29yh45Dp4tHh46Rn9WNbY+aasBOkxg
	ae70ZJRAUQsk/CiBa2j0v7m5p8i19bPrg7uh0ghiUtE5zpV4NLORUe4q7697T3YN9QxO
	QP1g==
X-Gm-Message-State: APjAAAXVz8iqC7zVHDkE+BJQHfQKXOQ9zywR8LrK1m1FB2CsvzC2Hmw9
	CPjXub+k1F8cjsYX9pQhlY1/iEHq91JsfQ==
X-Google-Smtp-Source: APXvYqyrKNDgurJEhM3masqxX1O10Q+fwwnylxAiMAQVlIe0p+mpeZ2fsjboG8eNVOVruRDqoSLysQ==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr45148323wrw.308.1561390545047;
	Mon, 24 Jun 2019 08:35:45 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	n10sm10013260wrw.83.2019.06.24.08.35.44
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jun 2019 08:35:44 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:35:42 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190624153542.GT30528@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
	<74882b72-57a9-bc45-76af-0be4b11a5327@gmail.com>
	<20190612135805.GV5803@soda.linbit>
	<2f0bb666-e3bf-1f38-025a-910b7a37ac1e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f0bb666-e3bf-1f38-025a-910b7a37ac1e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] history uuids misaligned within device_statistics
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Tue, Jun 18, 2019 at 12:16:45AM -0600, David Butterfield wrote:
> I should clarify that I observed the history_uuids misalignment as a runt=
ime error from libubsan:
> =

> drbd_nl.c:5091:21: runtime error: store to misaligned address 0x7fc223ffd=
33c for type 'u64', which requires 8 byte alignment
> 0x7fc223ffd33c: note: pointer points here
>   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 =
00  00 00 00 00 00 00 00 00
>               ^
> =

> 5076 static void device_to_statistics(struct device_statistics *s,
> 5077                                  struct drbd_device *device)
> ...
> 5090                 for (n =3D 0; n < ARRAY_SIZE(md->history_uuids); n++)
> 5091                         history_uuids[n] =3D md->history_uuids[n];
> =

> The history_uuids are declared with __bin_field() which does not appear t=
o specify an alignment.
> It happens to follow a 32-bit field, so that's where it lands.
> >> 272         __bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(_=
_u64))

Right, this comes out as a char[HISTORY_UUIDS * sizeof(__u64)],
and as such won't have an alignment... okay.

So maybe we should instead do memcpy?

diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index adeb04e4..f77df9da 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -5074,15 +5074,13 @@ static void device_to_statistics(struct device_stat=
istics *s,
 	s->dev_upper_blocked =3D !may_inc_ap_bio(device);
 	if (get_ldev(device)) {
 		struct drbd_md *md =3D &device->ldev->md;
-		u64 *history_uuids =3D (u64 *)s->history_uuids;
 		struct request_queue *q;
 		int n;
 =

 		spin_lock_irq(&md->uuid_lock);
 		s->dev_current_uuid =3D md->current_uuid;
 		BUILD_BUG_ON(sizeof(s->history_uuids) !=3D sizeof(md->history_uuids));
-		for (n =3D 0; n < ARRAY_SIZE(md->history_uuids); n++)
-			history_uuids[n] =3D md->history_uuids[n];
+		memcpy(s->history_uuids, md->history_uuids, sizeof(s->history_uuids));
 		s->history_uuids_len =3D sizeof(s->history_uuids);
 		spin_unlock_irq(&md->uuid_lock);

Or come up with a "__u64_array()" field type,
that would add an __attribute__((aligned(8)))?
 =

-- =

: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker
: R&D, Integration, Ops, Consulting, Support

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
