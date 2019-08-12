Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A257C896A7
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Aug 2019 07:18:09 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B5AF101AC47;
	Mon, 12 Aug 2019 07:18:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id BB22E101AC44
	for <drbd-dev@lists.linbit.com>; Mon, 12 Aug 2019 07:18:05 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id 31so103481213wrm.1
	for <drbd-dev@lists.linbit.com>; Sun, 11 Aug 2019 22:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=de1+6jkKy1tI8HI9X1bxXTNN8xwWcktKvrx/tWqPhWk=;
	b=SfHtUR7JBxbNpjZBtHw0aQ3j08Ul6evLkBRDMIwFY1Gia2FlwVhJbU4QeZOTopZW3j
	9XUbxPwBFtMfz1IUpzrlDFHeUga0jq0YRGrAgHZNYmWm/z9H8nt4EZ8spC6JUryMajPZ
	8RElL5pHWeDaOOOvM3oCQQT1Dmcpt913HSqKlVj6RpDxQw8vbvgXCuz/gSatKQp4lMD9
	2+EQr0lj1MEwShALSfw4E3zLDXd0l+SDBY0g3b8K851U6pcCobFF/PgWGDtZ5an1EkjO
	KRqPMe070Uu7RZx7Krg7GncaVHhBDgGjctwKfIdON/e2Y8xLmMWlyQzLjCIRFadkWLQ1
	q+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=de1+6jkKy1tI8HI9X1bxXTNN8xwWcktKvrx/tWqPhWk=;
	b=WwSSH89p5al7hyYPtvgp0/smdmR3z6n/6BPygcM36niavtkLr59eZ0xgKpD7a3BO+X
	bUZxbXbPgOiDTlVy0ZIhNIHsks3Tn6NncS8h0nlUw1spJOH4Bs7k/872QwA55TdryAz6
	S5ig6V+tIJVHh+Kc3cdgRtKBoKZ36jpAvOWJMEBh5XBNChkEbgT0sQdh9VVZ9BvyTJjW
	UXHlydrnaNqiasm2hgqVzVlgiQr8+95LuVUDXH/v+3xTrzFx5/mig29bnENhrHTKxY3o
	dxNGj5oVpc/fzg+H+LT7pJX9q0toNGwn7PRnlMcQNC9RffYuYa6QcR8XnNFe7UknAfQc
	nw2g==
X-Gm-Message-State: APjAAAXTjXUOyeSMlJ4KZSwifYFEdbgvVtwcRsaEAh4ied5xuRUzzHOo
	mnv0D65fXgZHt+gwqtAw+fWgIlH86/b4paul
X-Google-Smtp-Source: APXvYqzGkfMYVeGUM5AIfWZvtCtRXS7BQ4HcdobD9LU/fdcJiCOxjgWLmNpHNlaBWxsZrXhHRkTrdg==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr19354364wrr.243.1565587084644;
	Sun, 11 Aug 2019 22:18:04 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	s25sm9877579wmc.21.2019.08.11.22.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Aug 2019 22:18:04 -0700 (PDT)
Date: Mon, 12 Aug 2019 07:18:03 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190812051803.pkmmm5ize2f2plki@rck.sh>
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

No. With DRBD10 we will give up RHEL6 kernels. From a quick look at the
build matrix, RHEL7 then has the oldest kernel we will support.

All in all the build magic/compat, especially for HEAD (which is the dev
branch for 10; there is also a stable one for 9.0.X) needs some love.

So yeah, thanks, but for now play with something else, it will make you
happier :D

Regards, rck
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
