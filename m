Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id C524A896AE
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Aug 2019 07:22:07 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 120D2101AC48;
	Mon, 12 Aug 2019 07:22:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 691F7101AC43
	for <drbd-dev@lists.linbit.com>; Mon, 12 Aug 2019 07:22:05 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id j16so1183536wrr.8
	for <drbd-dev@lists.linbit.com>; Sun, 11 Aug 2019 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vya3dLn2YVYGorbZe9aZt0QB8iFSXdDY/o9eybD/1XU=;
	b=EX0JUa7AevZDWq0PxnJz58ZeKjcKq9lrr7amgxBRI+CJYehqoEh/2k/6kffI82Rvhh
	9P5tfOdopSeLBNWpE5kqVBm5LqYoJyomjvb5P2MjJ14hjmLpQDsv791SljU4uj3KXKvD
	Bg6udpVo9bzPhQvj/YkO2vAt4w2SLCVaz/4Hwi7bT0S2YuSNaEaToA3//5aBW8VWGrAX
	TBm2aIFV4deNBQDewL4q5m8SSX/GsA4/KcgIb5mgYMKERsWBuSPliYbR+Gs2iV0UCrU1
	2y1rWYo7s9GtH/IEIIEBooLpeNDsj2KftHb5NUg6XCbz2KhFpIIHXe4xmYKhBP4DA11D
	A1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vya3dLn2YVYGorbZe9aZt0QB8iFSXdDY/o9eybD/1XU=;
	b=fT0SH+QW5lExG5kdh1H6UhqbXguP9P1i7JTyFdL0Z3Rsb3B04j+F/r7GGYcYpyw2xo
	nniVTdDv2oyFv4MWkAJHvdiUdxOgOe8sD+2FwzGiuD5qpPgvTt4gfUFU2EjMFtjAWSjn
	ggpXLeU7IBaXhiFIQUwD7afg+teCBY6Ppv5tZ6goA00ld2R75jPQ7bCh25+lDmJ4X8xj
	ggOFHhIMCmBKb0cnRhdjtlsxbuNw/Ol4Omo+XldXgo/VAWsCMmFpzq7KIQh/COVibouY
	cs17lc2mdUjSrhDBvhBmEBkfHgGX75h2/YyTT3l1VjxBKP5aXskJcLX/Y2wp0LFQyqFu
	AaTQ==
X-Gm-Message-State: APjAAAVoal1Sy+3KGPq9+wP7ZNHcAYqz/0r9oPViNwXgthP0KeZPSOnP
	ucWUApLZfO2b3o3eYqPN3TtSNn2TIgXV92pR
X-Google-Smtp-Source: APXvYqwbdUzennIujFNCZQi+fCyNC91iarAot2Vrn3hEOzi8M8eB9BuuR4ItrhPbzniE+3fMrD9l2w==
X-Received: by 2002:adf:dc51:: with SMTP id m17mr40093039wrj.256.1565587324385;
	Sun, 11 Aug 2019 22:22:04 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20])
	by smtp.gmail.com with ESMTPSA id i5sm6717251wrn.48.2019.08.11.22.22.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Aug 2019 22:22:03 -0700 (PDT)
Date: Mon, 12 Aug 2019 07:22:02 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190812052202.ats3cq4xy2tjimjq@rck.sh>
References: <1bc428a7-2cab-fba7-f521-d96ba1f6c7df@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bc428a7-2cab-fba7-f521-d96ba1f6c7df@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [Drbd-dev] using new cocci config on older kernels
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Sun, Aug 11, 2019 at 11:20:04AM -0600, David Butterfield wrote:
> In drbd-9.0/drbd, using the August 2 checkin "Prepare 10.0.0a1":
> I tried building with a few different kernel versions, using commands of the form (e.g.):
>     wget https://cdn.kernel.org/pub/linux/kernel/v3.x/linux-3.4.113.tar.gz
>     ...
>     make clean; make -i KDIR=linux-3.4.113
> 
> First question is whether I should be expecting that to work all the way back to the
> expected DRBD limit of 2.6.32, or if the limit has (intentionally) been changed?

And FWIW, the "expected guarantee" was always for the RHEL(6) kernel with
its gazillion of patches and backports, never for that upstream version.

Regards, rck
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
