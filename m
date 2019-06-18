Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522649E34
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2019 12:25:49 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 803941028A6B;
	Tue, 18 Jun 2019 12:25:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A47C1028A66
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 10:47:14 +0200 (CEST)
Received: by mail-io1-f67.google.com with SMTP id u13so28039786iop.0
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NEpobXxuxRYF/6w3b5Zb3CzBIaUKJNR0veD3jOPVplU=;
	b=LbVAkkUXr+gIGGJUtd3LVA4InEgASROgO+LLe3xT36RLXku2qM3Urp6HgGUf7I+s2O
	mkB4r7lBhGb8us7a1BhHrbLN5Ley/E19FVbMxBmbTqDXzT82m4jnaLwRotD2TCWe1H+b
	adFnne93z2vEbtiLG7zZDiTzzPS0/iiU5Jw6n+zo4uIbq5ItyF+WiEK2b+8Cud5bMV0g
	x10+N6+ovVyyyksVmf+8LqQpAZF7ZK9uEvR052qs3AHg1957ot6I4gt9QJX77kIcWVvI
	TkNexXy3hybqBwiJjqvRXxIywcsYxHXam5W4qWsmBZCSf98PQDPtDy/WZo80E4BuScde
	hv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=NEpobXxuxRYF/6w3b5Zb3CzBIaUKJNR0veD3jOPVplU=;
	b=V9OCW/1zwCSACxJXJkT5tUbP8XjgWstbUR18YWDP1jdPHGmSDPzvdiUqzBzXILfJrU
	QgobXoMaFZCGp4Ec662PHjGIEmqgRhnAbqMYtPBDOGA6BkB0Qad1ak3jlzlI+f3ojxSQ
	s6CG6bR/lRlgxyrTigZ9frJ5eutYogszBTQS4csd3CBVnpXmxwd3MutkwR0pGx2F3scy
	2ugfo7pM4nyuZ1N1GON3jZS1cvBWwHVim74H1DgPO+D7e41a5LcqyC+Zwn0q9gfHA0+E
	66DVO5oTtzkhiaGFfUX4COgd09oiKbZ3vUaTBkmPsZW14yXEH5TNjbA+z1cdnETTU121
	eM9A==
X-Gm-Message-State: APjAAAXXrL+86j1BOddg9DENS+H3B89C1JZ80lBfdlto8xCUGyDIl+dm
	eiFKfqocJsMRB5+exVprwauBCN+d
X-Google-Smtp-Source: APXvYqxY6+i7qwEGU+/e5BmCH/bsyMGoODMzZX6xZT7XI/jLDouSjjFukOgKJspKK1tEw0J4L/XsTQ==
X-Received: by 2002:a5e:db4b:: with SMTP id r11mr19653761iop.172.1560847632426;
	Tue, 18 Jun 2019 01:47:12 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	q1sm13484971ios.86.2019.06.18.01.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 01:47:11 -0700 (PDT)
To: Robert Altnoeder <robert.altnoeder@linbit.com>, drbd-dev@lists.linbit.com
References: <e9d5ec6e-30e9-9af1-06c3-bcf8b1d92068@gmail.com>
	<20190612141149.GA5803@soda.linbit>
	<83e97127-9511-7899-e9e4-2b44a7932661@linbit.com>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <f1bbf160-8496-dea5-3257-45859b20dfac@gmail.com>
Date: Tue, 18 Jun 2019 02:47:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <83e97127-9511-7899-e9e4-2b44a7932661@linbit.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 12:25:45 +0200
Subject: Re: [Drbd-dev] running DRBD in usermode
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

On 6/14/19 3:49 AM, Robert Altnoeder wrote:
> Only changing errno to _errno to fix this is probaby not the best idea,
> so if we're going to change this, then I'd rather use a new variable
> name that does not even suggest being related to errno, otherwise
> whoever sees it the next time might be tempted to change it back to errno.

Sure.  I just thought I'd point out the few things I noticed along the way.
How (or if) they should be fixed isn't my aim.  There was remarkably little
trouble getting 50,000 lines of DRBD kernel code running in usermode (using
as a base the project I did a few years ago bringing SCST to usermode).

I compile the DRBD source nearly unmodified, providing a simulated 2.6.32
environment around it so it feels at home (using its kernel_compat stuff).
The only changes to DRBD source code are temporary #ifndef around rb_augment,
netlink multicast, and nested spinlocking, which I haven't written
emulations for yet, plus maybe another dozen places with 1-2 lines of
change, most of which I hope to eventually be able to clean out.

> While I'm at it, I am wondering a bit about the modification of DRBD to
> run in usermode. It's not that I couldn't see a whole lot of reasons why
> you'd want to do this, quite the opposite, but I believe it would make a
> lot more sense if you did that on top of a true microkernel OS such as
> e.g. Minix, seL4, Integrity or QNX. That might even turn the whole thing
> into a very useful project, as such a port of DRBD might be interesting
> for use in e.g. embedded systems running those OSs.

Any of that could be done.  The "platform" I ported to was "POSIX system
calls along with a few libraries like pthreads and libfuse and my multi-
threaded event engine".  (I probably use a couple of Linux-specific system
calls or options, but those should be isolated and easily replaceable.)

The "usermode_compat" ("UMC") code that (partially) emulates the Linux
kernel environment is in a separate layer (separate repository) from the
"Multithreaded Engine" ("MTE") layer that provides basic system services
(memory, timers, threads, socket event polling, debugging, etc), with MTE
services accessed through a "sys_service" ops vector (which was designed
*without* having in mind using it as a base to run Linux kernel code).
(I wrote MTE first, then got the idea to write UMC using MTE services and
use it to port SCST to usermode.)

The UMC "Linux kernel emulation" layer should be able to operate with any
"sys_service provider" that implements the functions behind the sys_service
ops vector.  The MTE is about 7500 lines of code that could probably be
re-implemented as a smaller shim to an alternative mem/time/threading
provider such as a microkernel, without disturbing the Linux kernel
emulation layer too much.

These are a couple of diagrams from the SCST project that show the layering:
https://davidbutterfield.github.io/SCST-Usermode-Adaptation/docs/SCST_usermode_service_map.pdf
https://davidbutterfield.github.io/SCST-Usermode-Adaptation/docs/SCST_usermode_includes.pdf

Regards,
David Butterfield
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
