Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEC6113B6
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Oct 2022 15:56:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C465421771;
	Fri, 28 Oct 2022 15:56:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
	[209.85.166.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 855FD420671
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 15:56:53 +0200 (CEST)
Received: by mail-il1-f174.google.com with SMTP id z9so2969465ilu.10
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=sNmbf1DrFhGYblawzk2OE47DJTJRUcUrHVQAL/CfprY=;
	b=dG6ulbLayOltV06VckG15ZM5FJG6iiZzromr13Dxi9USxiXVkCtDGqYIAKXSbEjEsg
	6/4zFI9eNDP16ioOt8eBqfK8LLHx9YAtHYAYPLbwGmmU5UBbzmoybUtx16fyzkvhSzR3
	HPY9oV/7QoeTtkKuooaEE+gZnrMu+aqm39boPj7zzGFLLvQJ6VBcsZBBqut7VaIb/buj
	q895fmC/zzzcl+kzWfQ5az43Fi57FG/UVkb72MqRQqVdXSkkuM09YdFcOS8Tska1OEc5
	j3FPfxhv11zq8/5nlaYYCS0Zbo0fVkH/+r+h15pChOem9+8KkNlUI3gQ8khWOzAEmFqK
	kHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=sNmbf1DrFhGYblawzk2OE47DJTJRUcUrHVQAL/CfprY=;
	b=ATXzIyuiaXAv0pmdROXUrxNhC0swcPSTBnLpPaXHptdssRxdz7dVrSL/QIfKTjD64P
	5G26le4qJjimmt7e/PmgpkFtYEH7kc227W9bvPawuaDNUC1CL3XQ8BrZafwhVOhWSnuF
	E5MfmDQ+N3ImQI3wg18pcURVdhqQ3j/cZAZlc3lmhsv2eRcFWQuROCL2Xe9QUOXTZFtd
	/wvLMTeEg5DmwCWdik+9gBh+4RDuJBMHyCs/4jWC2VpPWw1c4PsLa9P+wCY6PggIGhle
	dMMWwf04sIj/JsU/rsa02Re2fd92qIwOiChCaXY/a8Hw6UcGfHKVf592c5E2qIW+ISbW
	CpmQ==
X-Gm-Message-State: ACrzQf0KEWgsZBdGvGrZMih1DVFmpJpHkRwqP08Eu7hXeyMO0v5bmCrv
	yqY6wBUZD0s1X3YsY5lD/avmUg==
X-Google-Smtp-Source: AMsMyM67Rc2FdwlFNx71PR911GhNj2eaxZcauUCfpYlVrbJm9CnlVNFcL7nioQrLtCwqwEdextZnag==
X-Received: by 2002:a05:6e02:1e02:b0:2fc:6288:e6e6 with SMTP id
	g2-20020a056e021e0200b002fc6288e6e6mr35376483ila.172.1666965412619;
	Fri, 28 Oct 2022 06:56:52 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	k11-20020a0566022a4b00b006bba42f7822sm1704584iov.52.2022.10.28.06.56.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Oct 2022 06:56:51 -0700 (PDT)
Message-ID: <60b91c39-1e54-ac8b-5e9e-db7e46ca2d60@kernel.dk>
Date: Fri, 28 Oct 2022 07:56:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.3.3
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, Christoph Hellwig <hch@infradead.org>
References: <20221027150525.753064657@goodmis.org>
	<20221027150925.819019339@goodmis.org>
	<20221027111944.39b3a80c@gandalf.local.home>
	<Y1uSG/7VXWLNlxlt@infradead.org>
	<20221028062414.7859f787@gandalf.local.home>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221028062414.7859f787@gandalf.local.home>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Guenter Roeck <linux@roeck-us.net>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RFC][PATCH v2 04/31] timers: block: Use
 del_timer_shutdown() before freeing timer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 10/28/22 4:24 AM, Steven Rostedt wrote:
> On Fri, 28 Oct 2022 01:26:03 -0700
> Christoph Hellwig <hch@infradead.org> wrote:
> 
>> This is just a single patch out of apparently 31, which claims that
>> something that doesn't even exist in mainline must be used without any
>> explanation.  How do you expect anyone to be able to review it?
> 
>   https://lore.kernel.org/all/20221027150525.753064657@goodmis.org/
> 
> Only the first patch is relevant to you. I guess the Cc list would have
> been too big to Cc everyone that was Cc'd in the series.

No it's not, because how on earth would anyone know what the change does
if you only see the simple s/name/newname change? The patch is useless
by itself.

-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
