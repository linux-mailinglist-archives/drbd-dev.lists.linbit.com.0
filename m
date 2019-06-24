Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F15179C
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2019 17:49:54 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 5512E1028A6F;
	Mon, 24 Jun 2019 17:49:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 23D321011BFF
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 17:49:49 +0200 (CEST)
Received: by mail-wr1-f46.google.com with SMTP id x4so14449317wrt.6
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=GBDwmUyk9BQKk1Nap/HaXzvstZBlmFb/7TCtb7ZNGdc=;
	b=AH5Yg6TkFKl1y8xoORwoFJxDusQ9TirZwLLH6siZXoqhjbwv2RCiT37srS76+ArKGI
	G0KDumrP28m332V0IvptC4CyjrLCo1OF0uumV2I+lQvTqMP9VjnKQ4+7kF0dtf8kpXTR
	t35rKIi87VG6+GQq3oKWLEMcMtzzVSADtEphqAVmOqjlFhCvouB9YqHCL+7Cn04eY3np
	mfhoGcw02/k5Kc/dIGqVCTPcfBW0q4l3AFpwB3JVPA7tpv68uit4WtfiAW9sWUthe2Fr
	Qyd2vQ14nC6eo9KQUJPr0nRQpQ/+t4AvlhfSPRKSgDtt1RlfyzeRm3NDOiw1Ng6iJT05
	ir8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=GBDwmUyk9BQKk1Nap/HaXzvstZBlmFb/7TCtb7ZNGdc=;
	b=msCNJW1TkMQ8BHeGnOlCRIXWZwt5OBuv73JDqGRWv0mENpiWeSVlo0FYrhtkH7NIQg
	5kdv0yfWjFjM/tp9Fn4Rj+6gTYOKfEMWuUCm6+6vAPQ4S68x28GluCB4suy2sE34+LmF
	iRUAKuPKoPfxyHqA/GAmKimHZWr45IFUs/gsiy0ggl7U5+gacGjjI+/RD4R4nMNo8UiJ
	ipKVlgkxHMoqZNfoSLlRP8XfpnvpOoT+mlEWvpU+2bE3UOetmXyqpQioV0jnkpDzkS+3
	5yB2qXbiH9IjkKqogFNj85HdYjqrDjlvC160Xl87MzhrdqiuBG2nln5+NI7KzfVjjmhs
	fLtg==
X-Gm-Message-State: APjAAAX5tjBlaZslqdcBUvJ4qvt2wPN07Pxop8BGRPde7EvHmo0NXJpd
	Cu+AupSr3hQM41bl2lK3CS/LQgrfjSA79Q==
X-Google-Smtp-Source: APXvYqzamBQG7WXvqW1opjti+9nuPSUtfMum7qWxEnekRmTZucpUWoWxrkNK0leICIVg31/wQSZe/Q==
X-Received: by 2002:adf:eecf:: with SMTP id a15mr34215444wrp.354.1561391389319;
	Mon, 24 Jun 2019 08:49:49 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	l8sm25567770wrg.40.2019.06.24.08.49.48
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jun 2019 08:49:48 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:49:46 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190624154946.GU30528@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] Checksum based resync block size
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

On Sat, Jun 22, 2019 at 12:03:55AM +0000, Eric Wheeler wrote:
> Hello all,
> =

> Can someone help explain how checksum-based sync and verify are =

> implemented in the sender and receive side?  It looks like the hashes are =

> per-sector (looking at read_for_csum?) and I am interested in making the =

> csum chunk size configurable, or at least hack in some test code to see i=
f =

> it would provide a performance benefit to csum multiple sectors.
> =

> I'm also trying to understand what iterates over the lldev and understand =

> where the csum takes place foreach chunk of data.
> =

> Any direction would be helpful.  Thank you.

As our in-sync/out-of-sync bitmap tracks 4k blocks,
we want to compare 4k checkesums.

Yes, that generates "a lot" of requests, and if these are not merged by
some IO scheduler on the lower layers, that may seriously suck.

make_ov_request() is what generates the online-verify requests.

What we potentially could do is issue the requests in larger chunks,
like (1 MiB) to the backends, then calculate and communicate the
checksum per each 4k, as well as the result.

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
