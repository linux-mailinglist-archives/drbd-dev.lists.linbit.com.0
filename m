Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id E58DB459CE
	for <lists+drbd-dev@lfdr.de>; Fri, 14 Jun 2019 12:02:23 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 356501028A76;
	Fri, 14 Jun 2019 12:02:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 394 seconds by postgrey-1.31 at mail09;
	Fri, 14 Jun 2019 11:56:15 CEST
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A856B1011BFC
	for <drbd-dev@lists.linbit.com>; Fri, 14 Jun 2019 11:56:15 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id c6so1679552wml.0
	for <drbd-dev@lists.linbit.com>; Fri, 14 Jun 2019 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=39Pn1z57ebmqZSkUampY/CbARlgiVXFsw1CA5ix9oZQ=;
	b=mMulgMOOkXQJpCpKA0S/uj6ZkOAHXlUAqRnsDgx6erHmUKfW3/QOJD+2kHuRgvCHUb
	9u8Sn/OlkoAGltKEiUqca7qfDMFrm6du12pCnKM0Fk6wUmlYuk/Al5gk/RulSWKNM3Fq
	X4/O0lJEJu+rH+d0HnmvZHSboGeMS8uieieAetDKWb8ubp61kGQ/M3qp6I6ndy4PYTBk
	MmOGG9Iu9xlemcXuTs5lTd2n5Iae624qK0QVzVGnQ6sfzGP8USHTHZX2JA64qsPIktEr
	CC+AyA3rc8xMgBuXdJz32ze+xEC+k6l/K9e3MXqGXKus/9h3xAqmjzQv486g5BZoQtgN
	XTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=39Pn1z57ebmqZSkUampY/CbARlgiVXFsw1CA5ix9oZQ=;
	b=snvhw2S005DpNugpwbQb9pkRqnNsQOf3KLTLWgEOD1WeeNzXqdV8iscop1fGi2W0in
	95TFnxsHyro7uckm0fXMT99zfDeavyPnK/1SPkYwK9bSOIqtegIYRAJIi+v+Fqt50+/5
	5luVBV5Q/U1ExZwam3vY8/IK3rsbZQ7zX4lpdd/1bGZyWcuhJcpInAC4m8xkpkDoXwPS
	zDzKjS+MrN6WSgFNCRP9m0O8709ZR6uswGkscS/ALmSfzQn1yMIos4kX5Ipx5KaS2aqe
	Osaa7POryQsR++5nLSE67EatvDxY7hJIGniMbtpCNpKFP5iAM+Ae3NWXV9J2kJhJmEf6
	rb6w==
X-Gm-Message-State: APjAAAWYcA4fNUpGQWlBH0Xc8ct1oDvEnfykqiQRm2cc3a9lErtwma9U
	FYdcZKVYjbSKoOitsH3yS7As9gno3Hls/uNN
X-Google-Smtp-Source: APXvYqxil0ku/F0wME3bLNiPE/Vzss2dEMm5k8mflfoGO+MMERQYDxXAV+ZwJeo/BcD6R4hg9whulg==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr7264991wms.8.1560505780344;
	Fri, 14 Jun 2019 02:49:40 -0700 (PDT)
Received: from ?IPv6:2001:858:107:1:2d96:e1e8:3a99:3414?
	([2001:858:107:1:2d96:e1e8:3a99:3414])
	by smtp.gmail.com with ESMTPSA id x8sm3425737wmc.5.2019.06.14.02.49.39
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jun 2019 02:49:39 -0700 (PDT)
To: drbd-dev@lists.linbit.com
References: <e9d5ec6e-30e9-9af1-06c3-bcf8b1d92068@gmail.com>
	<20190612141149.GA5803@soda.linbit>
From: Robert Altnoeder <robert.altnoeder@linbit.com>
Message-ID: <83e97127-9511-7899-e9e4-2b44a7932661@linbit.com>
Date: Fri, 14 Jun 2019 11:49:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612141149.GA5803@soda.linbit>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 12:02:20 +0200
Subject: Re: [Drbd-dev] avoid use of errno as a function parameter name
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

On 6/12/19 4:11 PM, Lars Ellenberg wrote:
> On Wed, Jun 05, 2019 at 10:14:19AM -0600, David Butterfield wrote:
>> Avoid use of errno as an argument name because it is allowed to be a macro such as
>>     # define errno (*__errno_location ())
> You do realize that we are kernel code...

I guess that's a request related to his fork of DRBD which was modified
to run in user mode.

@David:
Only changing errno to _errno to fix this is probaby not the best idea,
so if we're going to change this, then I'd rather use a new variable
name that does not even suggest being related to errno, otherwise
whoever sees it the next time might be tempted to change it back to errno.

While I'm at it, I am wondering a bit about the modification of DRBD to
run in usermode. It's not that I couldn't see a whole lot of reasons why
you'd want to do this, quite the opposite, but I believe it would make a
lot more sense if you did that on top of a true microkernel OS such as
e.g. Minix, seL4, Integrity or QNX. That might even turn the whole thing
into a very useful project, as such a port of DRBD might be interesting
for use in e.g. embedded systems running those OSs.

Cheers,
Robert

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
