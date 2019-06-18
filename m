Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 855384A8F3
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2019 19:59:03 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id BACC01028A71;
	Tue, 18 Jun 2019 19:59:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 55E781019AC6
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 19:58:57 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id r185so25943102iod.6
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DZbSsIxjjxs8DZpbpYtF4LhFdm+iLO08G/q0Hj14ieE=;
	b=eXA4uL9/oWkAuqfMTB+SfahFzjFLH/ufkvklBQfSfJhHpl21olFcBHxUPEYc6910bs
	9QgdRo2OCgFs5moc1DEakN+xjNP0F5PH7XKaHlvCO3S0GDjc17q31eCH4BnXQVkFR7gj
	G9kOy4QG2pINvXQ2aWx4oAIAm3g4mV2VevnbBLox2EbR7sQf1g7IGYmSdeL8RFTqfh+o
	ZAxbGePfjF/NPPqSHoh4BBNmF76dYT1k/ZhuepL176JgOD7CEkX9Idt1fcGrGCGk+ctL
	V4ZoNrTQEvMr3yHqCPU0AdRYLTshyzVCjZY9A1l9PcR7J3cQmP+cmjNKcptWpl6NeIlC
	6dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DZbSsIxjjxs8DZpbpYtF4LhFdm+iLO08G/q0Hj14ieE=;
	b=dRlT2zce9FKpAGPIlV1tDbJ0rJDS/YijSsoVRxfRcBdj2EKvjU3glQKQviGje7BZw5
	HBDcwfMl9Zdf+igGpRv37WD/UmYosyPDjGKwbeI+UmLGfh7Y4XmalW+fGeNg+yfsbfrK
	9MpJCZInttmx8r3qXH0KYqgkg9srw5ysFFb3PoozSNnSAxiq8jrEIocwjyUJAJu5FoH+
	4kq0zFUvOnjxnpN2aBt2okDig+rSe9N0ah6qOVj/b6C2haKo7TTNwSqBc0Q0g7VTF7sj
	WatOWT9C4JdIvWqtsNRTuX73DhkK2+QrUy+d26Iac8tVNHq8eiALEIEiPpJTrNtXTdTF
	fJcQ==
X-Gm-Message-State: APjAAAWe4Y/SyU+hfrGwmB4We2VXySJ45kEwrYn8yQ6VXKaEZJ3PbStg
	A62N/S0TYbR9T+5fSP7Kax8=
X-Google-Smtp-Source: APXvYqzJCoYcGXCXMcq3g72Zpu4+tYk1KeT0Er6fmzC1lI/vc89Aj6/iUu2/0+fKu7ur54ikmdcHog==
X-Received: by 2002:a6b:6409:: with SMTP id t9mr7004446iog.270.1560880737230; 
	Tue, 18 Jun 2019 10:58:57 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id o5sm11403074iob.7.2019.06.18.10.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 10:58:56 -0700 (PDT)
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>
References: <28397d5c-72ca-e4b5-fb00-7b55466e7441@gmail.com>
	<20190612142612.GB5803@soda.linbit>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <c60379e8-7117-0c80-3371-2a6f0e93fd41@gmail.com>
Date: Tue, 18 Jun 2019 11:58:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612142612.GB5803@soda.linbit>
Content-Language: en-US
Subject: Re: [Drbd-dev] main.c comments
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

>> (1) Isn't the third argument to module_param_named() supposed to be the type of
>>     the second argument?  (But seems to require it as a single token??)
> 
> Yes and no ;-)
> the type of the second argument in this case is a drbd_protocol_version,
> so by naming that as third argument, we point to the "conversion and
> validation functions" for that type.

Aha!  Thanks.  All I was doing was comparing the types at compile-time
and not finding a match.

> again, "details depend on the kernel version"...

Yeah, I'm pretending to be 2.6.32, the minimum supported by DRBD's kernel
compatibility, to minimize the amount of kernel function I have to emulate.

>> (2) The cast avoids a compiler warning about signed/unsigned comparison.
> 
> As long as our kernel compiles complete without warnings, "boring".

OK, I'll set my own warnings back down to the same ones the kernel enables.

For warnings that happen a lot I already disabled them, but there were
three warnings that each was reported only once in 51,444 lines of DRBD
code -- I had figured those conditions were being maintained and not
supposed to be there, so those are the ones I mentioned.

David Butterfield
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
