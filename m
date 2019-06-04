Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E434372
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jun 2019 11:42:04 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B61A61028A76;
	Tue,  4 Jun 2019 11:42:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A039C1028A6F
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jun 2019 11:42:01 +0200 (CEST)
Received: by mail-wr1-f53.google.com with SMTP id e16so6809685wrn.1
	for <drbd-dev@lists.linbit.com>; Tue, 04 Jun 2019 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ILUcji1pVMkHmE6o61vuIsd0iBRT+BzsI2VPoFg41lk=;
	b=nCEo0tl5STWP+dNd9/boMZSGz9rJSW96MARMMTeE7Wv9VWF0OOEo/MJNHmlK25l1lb
	lyagXh8wsD8ujavUllWkeFsRUTUNRHreAdt9YUE5g8C0s0vSooPVktLOVMK53OJypSaQ
	oaI4C8i0s4N2EJX2Z8bRgSGVkr4iNCM7J26zCUVOlfprsEos1jnlQkzUHbqJLOYdgsJx
	FitTiUWYvZmNiXvW3haw5gKkDin5p8G0rAv0scNZNRL11bDBgWIRqkkUlHLjXDl+AGLQ
	GW407/DtnpRh8lEqKVOw2L7h4yML0QpZwKAkX1tkpIflrm1Ayae4brk2/kkc79rovR15
	Jetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ILUcji1pVMkHmE6o61vuIsd0iBRT+BzsI2VPoFg41lk=;
	b=qbU91hTSBiPqPjjHbGuSOS4+H4GeECRJfWgApk8crjq0Ru+85MT/iRIJiFkud3Ofb5
	nZHsV3ffqz2reApAsM1jrgv5ZnvdZvuLsGsCqZ6UDaVtT9cLNp5yqOCBR8qksJmhUFLJ
	8RSNIIbjO27+pJjBPHUwz24KQUBgY+kt4JqL2l2AbibQc1BnxuMug9lW4pUdYMamYcp3
	PPjwgCDL1I/6aCULN9VKEHiMtG+HXWPkhFsu+WQTuahVp1Wn7oO/q/QauJKtKEEZoyZv
	yOeheqWjv/YT2oHFH7NcFrHhY2uIXR2HonnfLjRy3wQMljctE8oSZr8JsMqmHonThse5
	KwOg==
X-Gm-Message-State: APjAAAXWEyChDF+Fp4vB4YYw53rcHtcjQJ+OSEkt/NNhABlLR975qteN
	mwaOuZycOLnX5lVhKbDJwcB3Pm2u2Em6XQ==
X-Google-Smtp-Source: APXvYqzXWL3Bjxy4Jy0L1knsBpOcZbNCBmfmXpIlp/nHW7E7qlaqvkeCy8JL2DQ1CWl2cRKFNKeJSA==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr1457700wrr.37.1559641320544; 
	Tue, 04 Jun 2019 02:42:00 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	p2sm13617400wmp.40.2019.06.04.02.41.59
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 02:41:59 -0700 (PDT)
Date: Tue, 4 Jun 2019 11:41:58 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190604094158.GK5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] drbd_nl.c:drbd_adm_prepare() indexes drbd_genl_ops[]
 by cmd number
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

On Tue, Jun 04, 2019 at 02:18:02AM -0600, David Butterfield wrote:
> On 6/3/19 11:43 PM, Lars Ellenberg wrote:
> > Think again: how is family->ops inexed?
> =

> If you mean the genl_family, its ops are kept on a list, which is searche=
d using genl_get_cmd().
> Constructed as a list, it doesn't even (necessarily) have an an underlyin=
g array one might be tempted to index.
> =

> > How is drbd_genl_ops indexed?
> =

> It is an array, but it isn't indexed by command number,

Why, yes it it.
Because it is constructed that way.
Uhm. Wait. It used to at some point.
But ... not so anymore.
I can swear it used to be
[op_name] =3D {
}

in that "magic" header...

> except in this one place in drbd_adm_prepare().

Okay.
So we check against flags we don't meant to check,
even check with out-of-bounds array access (undefined content).
And potentially someone that already has CAP_NET_ADMIN
could do stuff we meant to require CAP_SYS_ADMIN for.

That's bad :-(

-_- :: accidentally correct
!!! :: allows NET_ADMIN to do stuff we meant to require SYS_ADMIN for
OOB :: access beyond end of array, unknown, possibly bad.

leaving off the -_- entries, I find:

OOB  [5]   =3D  {  .cmd  =3D  44,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
new_peer          [drbd],  .dumpit  =3D                           (null)  }
OOB  [6]   =3D  {  .cmd  =3D  45,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
new_path          [drbd],  .dumpit  =3D                           (null)  }
OOB  [7]   =3D  {  .cmd  =3D  46,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
del_peer          [drbd],  .dumpit  =3D                           (null)  }
OOB  [8]   =3D  {  .cmd  =3D  47,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
del_path          [drbd],  .dumpit  =3D                           (null)  }
!!!  [10]  =3D  {  .cmd  =3D  29,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
net_opts          [drbd],  .dumpit  =3D                           (null)  }
OOB  [33]  =3D  {  .cmd  =3D  38,  .flags  =3D  0x0,  .doit  =3D  (null),  =
                  .dumpit  =3D        drbd_adm_get_initial_state  [drbd]  }
OOB  [34]  =3D  {  .cmd  =3D  42,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
forget_peer       [drbd],  .dumpit  =3D                           (null)  }
OOB  [35]  =3D  {  .cmd  =3D  43,  .flags  =3D  0x1,  .doit  =3D  drbd_adm_=
peer_device_opts  [drbd],  .dumpit  =3D                           (null)  }

Someone with NET_ADMIN (but without SYS_ADMIN) could
 - change net options
potentially (OOB access, may or may not have the bit set)
 - create and delete peers and paths
   (but not connect them, or disconnect them,
   which would be required to do anything useful with a new path, or to del=
ete an active path)
 - forget a peer (but not disconnect it, which would be required to have su=
ccess)
 - be disallowed from getting the initial state, even though that should be=
 an unpriviledged operation

Luckily, "mostly harmless".

Okay.

Either we fix it in the magic header to construct an array
that has holes in it, but can then be indexed by [cmd],
as I think it was meant to be, and used to be
(though I may be misremembering).

Or we add an additional iteration to find the correct flags.

Thank you for point this out.

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
