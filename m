Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 8100934382
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jun 2019 11:49:27 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DDCA1028A7C;
	Tue,  4 Jun 2019 11:49:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 4DB431028A6F
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jun 2019 11:49:23 +0200 (CEST)
Received: by mail-wm1-f41.google.com with SMTP id u16so8760095wmc.5
	for <drbd-dev@lists.linbit.com>; Tue, 04 Jun 2019 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=WmzJznr9SJLGJJh4N/yFrPVQwiJAcobJh9+E7jxHIGY=;
	b=LB5Lm4QO7CWFJgjgqy67rxn1519qZ+Epv6JRR2sO+6py4+WfYz/H17OxMIwYoLB5Se
	SXqmPE8Oa5cnQfxzyqf4q3VErKh/vKracF4/LLkGJkPg6djRpLoQN6Gdar2D3ZkRuXRl
	xab5EeR9Bp+PP8tvtL+DXZe4m98IEvQrAC0iVtAwQhCkKk9zwo8F6rzB0llcKOmaNHkU
	axRoZ/qBU6yA3yJ9gj5E5cvVS0CRqWa90xIYcrxVtNcT5ca/gXNdFHHoA/0Qgac+7fp7
	6FcMxYJ6cdB15RWvWRUfITfyaMShXasalg1lOARRocaGj30ibTYyLMaXaBNASNELmuaZ
	T0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=WmzJznr9SJLGJJh4N/yFrPVQwiJAcobJh9+E7jxHIGY=;
	b=JdSZu1KnABHbX6XaWFydWOHoFQNzCbiOMUTiBmRC5LfGQL61CGLGzQJkD7DxoB/TWG
	vJtDOoIy3g2m4QlsdAX2Nz3pwnYd+6dSgrhwCVRzuDe+wFcpMGCP1WH9T2lBGpnU4gwS
	UGW8FrWKq8S+Jtrl/7YEkXP68SLxIUABVG8CxTCD9WnsJhGPJnEDQ/O3V4PUBLqETocI
	Ge+ApznO14ywnsDo5FG8h6s7yWiFt66TMfH2ab5y+MfOTYbISQ2qqJ8P/PDEDxcIep1U
	GLN57o+xuj9rMTRASMG8LDbycD4clNJpU/5x2RyVtk9+ZTFOSo39w6QKbjEpelFsn6sB
	fp8w==
X-Gm-Message-State: APjAAAVeq0GXC0L3P97FUKI5zFK7dTZ9WTsrB5GQUs+UkJoasDgC1a04
	hnh1LRCUxonAGvd5b8+RCLxGsG4OO1pcvQ==
X-Google-Smtp-Source: APXvYqxAIVuaGrHJhCX1KMJEG46sSCwlOHssKRbyvCaWgReFXFurRzJC+GoDIZ5SLi2NsOXdPXWEfA==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr5849124wmc.14.1559641762513;
	Tue, 04 Jun 2019 02:49:22 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	f2sm18510923wme.12.2019.06.04.02.49.21
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 02:49:21 -0700 (PDT)
Date: Tue, 4 Jun 2019 11:49:19 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190604094919.GL5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
	<20190604094158.GK5803@soda.linbit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604094158.GK5803@soda.linbit>
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

On Tue, Jun 04, 2019 at 11:41:58AM +0200, Lars Ellenberg wrote:
> On Tue, Jun 04, 2019 at 02:18:02AM -0600, David Butterfield wrote:
> > On 6/3/19 11:43 PM, Lars Ellenberg wrote:
> > > Think again: how is family->ops inexed?
> > =

> > If you mean the genl_family, its ops are kept on a list, which is searc=
hed using genl_get_cmd().
> > Constructed as a list, it doesn't even (necessarily) have an an underly=
ing array one might be tempted to index.
> > =

> > > How is drbd_genl_ops indexed?
> > =

> > It is an array, but it isn't indexed by command number,
> =

> Why, yes it it.
> Because it is constructed that way.
> Uhm. Wait. It used to at some point.
> But ... not so anymore.
> I can swear it used to be
> [op_name] =3D {
> }
> =

> in that "magic" header...

> Okay.
> =

> Either we fix it in the magic header to construct an array
> that has holes in it, but can then be indexed by [cmd],
> as I think it was meant to be, and used to be
> (though I may be misremembering).

That won't work (anymore),
because that would be rejected,
we would not be able to register that =


So we are back to this:

> Or we add an additional iteration to find the correct flags.

Or our own "bit field" to flag "privileged" operations.

Or we decide that "CAP_NET_ADMIN"
is sufficient to (re)configure DRBD.
But I don't think so.

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
