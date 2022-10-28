Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB5611420
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Oct 2022 16:11:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79A69421788;
	Fri, 28 Oct 2022 16:11:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52D2F420960
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 16:11:31 +0200 (CEST)
Received: by mail-io1-f46.google.com with SMTP id h206so1156258iof.10
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=kGB0yLuP8CITE3oAOA1XPVmKhjSqbWLjvxAfBGLgZKA=;
	b=0z66opcyZ//OUKHR6i+YUV9zNteirxKzVrdMRkn0+t0luxKI9/P6+kH98WqeYPwWOP
	hd3EIXwncilkJxXhLXlKVfmdH2pDo3lfHq+9bFl3L/Kc/f5ySbf/0zXUGnxYQKqSn5El
	ejjYwTczrw7KnUVP+04ANMYgKqO8pZRJMtT5YoeqqiCfsjqk/zJGUGtpb8by4sNTF5g1
	NT7PUPSDk9/l6OlE+zWWbP8fvgQeQ+goVHsVjTR+ImIICz28N+hGiTJy6RntgiPd9AWk
	9zlKeTWllGAXlQRfjBtK+s2XipUhQ5LxhQ2XSpT9TFct6VqvGtZQMeNUFELFPT87uJIX
	lBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=kGB0yLuP8CITE3oAOA1XPVmKhjSqbWLjvxAfBGLgZKA=;
	b=oU1BZyCdTnUoXwAhoRRB//P/k3z/l8zfU5hskJnnvuhs6b4iSdvpZGFOLcX2wN0+Gk
	KO9I3/hSNgThNNvVz9S8M/c+OfyCcDTSOLHCCOtxT700Nee00SVjUJBFXhGivfDyBDe2
	2n3QAOvZeugiWqZ0GFDbX251yxnblydE/OR4EN9NFpzfpHdP7X6t56aMMMi+njYrCyca
	uNGlHFh4j3F8BjrHndTh946hcVHdpMGxC1aqwoqusELYxAwW8cHspAw4G7r6UwC96fw9
	UkczUfWDqCIi+wY8G/vJWVZI0gJbnaOiSshj5xFkFWbYFmRyuSOfPFsCT4OaNyXreUE3
	pSGQ==
X-Gm-Message-State: ACrzQf3BsljrK7smlZ2QTpDd72hYA1R+AbrQN9ayymDl3rFPHSUD1gaO
	wAwMOXN+9ykTGmmgB6kWEOxJBg==
X-Google-Smtp-Source: AMsMyM4/5ZopQptSCtSMxaggiFO9t/PzM0w/oOyCZM7WtIJHpTZirom0eWqLcxmWEoYqJZ8S/K7f4w==
X-Received: by 2002:a05:6638:164b:b0:363:de33:99dc with SMTP id
	a11-20020a056638164b00b00363de3399dcmr38538555jat.117.1666966290311;
	Fri, 28 Oct 2022 07:11:30 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	n23-20020a027117000000b00375126ae55fsm1711886jac.58.2022.10.28.07.11.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Oct 2022 07:11:29 -0700 (PDT)
Message-ID: <9bb423f8-5910-494d-2522-2fcf8e41c2e4@kernel.dk>
Date: Fri, 28 Oct 2022 08:11:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.3.3
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
References: <20221027150525.753064657@goodmis.org>
	<20221027150925.819019339@goodmis.org>
	<20221027111944.39b3a80c@gandalf.local.home>
	<Y1uSG/7VXWLNlxlt@infradead.org>
	<20221028062414.7859f787@gandalf.local.home>
	<60b91c39-1e54-ac8b-5e9e-db7e46ca2d60@kernel.dk>
	<20221028100656.00a4d537@gandalf.local.home>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221028100656.00a4d537@gandalf.local.home>
Cc: linux-block@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Christoph Hellwig <hch@infradead.org>, Tejun Heo <tj@kernel.org>,
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

On 10/28/22 8:06 AM, Steven Rostedt wrote:
> On Fri, 28 Oct 2022 07:56:50 -0600
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 10/28/22 4:24 AM, Steven Rostedt wrote:
>>> On Fri, 28 Oct 2022 01:26:03 -0700
>>> Christoph Hellwig <hch@infradead.org> wrote:
>>>   
>>>> This is just a single patch out of apparently 31, which claims that
>>>> something that doesn't even exist in mainline must be used without any
>>>> explanation.  How do you expect anyone to be able to review it?  
>>>
>>>   https://lore.kernel.org/all/20221027150525.753064657@goodmis.org/
>>>
>>> Only the first patch is relevant to you. I guess the Cc list would have
>>> been too big to Cc everyone that was Cc'd in the series.  
>>
>> No it's not, because how on earth would anyone know what the change does
>> if you only see the simple s/name/newname change? The patch is useless
>> by itself.
>>
> 
> I meant this as the first patch:
> 
>   https://lore.kernel.org/all/20221027150925.248421571@goodmis.org/
> 
> Which was what the link above was suppose to point to.
> 
> It's the only patch relevant to the rest of the series, as the rest is just
> converting over to the shutdown API, and the last patch changes
> DEBUG_OBJECTS_TIMERS to catch if this was done properly.
> 
> That is, patch 01/31 and the patch you were Cc'd on is relevant, and for
> those that want to look deeper, see patch 31 as well.

So we got half of what was needed to make any kind of sense of judgement
on the patch.

> But if I included the Cc list for patch 01 for all those Cc'd in the
> entire series, it would be a huge Cc list, so I avoided doing so.

And my point is that just CC'ing the relevant list for patch 4/31 is
useless. Do we need to see the whole series? No. Does everyone need to
see patch 1/31? Yes, very much so. Without that, 4/31 means nothing.

This is pretty common for tree wide changes. The relevant lists need
to see the full context, patch 4/31 by itself is useless and may as well
not be sent at this point then.

-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
