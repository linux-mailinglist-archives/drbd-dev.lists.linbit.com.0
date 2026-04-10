Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHBlJQxP2Gm1bggAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Apr 2026 03:14:52 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 39A973D1077
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Apr 2026 03:14:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A13E716311D;
	Fri, 10 Apr 2026 03:14:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
	[74.125.82.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B5C051630D4
	for <drbd-dev@lists.linbit.com>; Fri, 10 Apr 2026 03:14:37 +0200 (CEST)
Received: by mail-dy1-f180.google.com with SMTP id
	5a478bee46e88-2ce102afb0aso1924914eec.1
	for <drbd-dev@lists.linbit.com>; Thu, 09 Apr 2026 18:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775783676;
	x=1776388476; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=hX2F5vH0vhGHSEsyxW1VmGmKOMoX7KwT4uNWvZ8qcRo=;
	b=dQpBolllucicwuDwCd6V0TR9+tGOQjZJyyFXjb94Px88UHFm7oebg8OdV5ar2k7H+e
	h5lpOy7lLSJpGGb1MNVySnG0yT3uavPLMlHqfvhE73E/2dQbgC61rIvi/rhte3GBDpHZ
	gNs0YIuKw1VzW5C78clC4WjTZXxXWJm4PD9eiHlk+j4g8oZ5fXl/NWS/vvSme5HGLdBO
	Qv2q4Yctnf7flXMf/d9F0WtWWfj72V3JHH/G4loY3LFaW72+Qm7UX1lhuAc771Q8spc7
	Lry1wncWLg7Dac4xoOgpBNEKx5+KyBLWjVebYsODQVgbQQ6Hysy7cNB++ue1xm4cKgmn
	rZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775783676; x=1776388476;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=hX2F5vH0vhGHSEsyxW1VmGmKOMoX7KwT4uNWvZ8qcRo=;
	b=icGUPLhjkZ/KkwjleZJfP1hr9X8xAnhef71U/xjI9KpuLFJWBdU49lfcwAJg6OieUd
	oWDutKFQNyeu5SKboMfy3vI+iTSoh0S1EX3jFJQAIWpkJluvx1bBJ5owkZdIJQ54y/yl
	z0MHpzJDlqpWEqlh2BVSbbqOElQGwlb+y8rIWSqQkUNtn6WHCXls633RV53AteQdPQnx
	eeoxqFumr6nT619srXUphyg4HLeWdUMwCUXRsQgSVSF17ABLE75E6A5odpKKMqifjs0N
	5SqB4Rw7hJdrVZFtx7m9qkdL3mR7xpjbvP8C5UJ/OFwOtW3rHzm15TsNPQHOAwGOVGFW
	hjSw==
X-Forwarded-Encrypted: i=1;
	AJvYcCW5EZUqSElLJVMFLJgO1XzqgQbpg5OjrQXJT3YzOJhSpYlmTv7Y25ytbKrJ8W/sSoS8V8/Az83ucQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YyaDaPA5jRQ5hHyQ2dyRam9VllNx6eS6p5Tu8tqDw1wQKN0v8bi
	fO2IO7uFaSDC0g6nyctUh4lfRqwjTax2tHWx+qyVWxsTU6bfKLTle8bdspy4N5xwjvo=
X-Gm-Gg: AeBDietWJAz8t83A5i7BX9EwPHOMq0OoEwQu8KRFtWMS0JloPra2dgNoXyBf8o7ohIb
	TGAmw2T259Jt/h/2nlFGP0x7+Vv3mrNX6D5ZZH4EtR/bhyqTIC++7AVfqJ6ENGR3k4jmNsY4P+c
	tR+goRqi58i4jTpR3ev8VdV3EWRQT/g+fVum4cc1GwVXRhdO0qQelvkzZSODCOXNwHJLl9YPDwF
	2AGV5Gngwdj3rG71IshgUJkuFTMvUa/5+AeGbNEWLmB0ofRuI8toEbh0xOGlj516CNDYsxFWV81
	ONk8EZZbiLa+tnrREwNMMtZ5owhgKKXGZSt+yc+/ww+gI42w2qslpDc8nKBwZajlw/e59qjjoRf
	m9Ya7HqIM+5X7ZTa8nOkncGQJhC2XTCbEjTru/lddhX35kpCgs4Ixm1yq/p6mMQypQSwBEfkAep
	ue/tkgLzGA3tHyz+8XFhMgemzsSUoJ/LbSn5YYTEBn4gqmvOaGeQMw0NGL6VObbW8uIgUbyKusP
	y/NgMu71FbLQ10zG95VwJoWIQyVpbKwCeoiZhzWawks6EzrXuTQP1Y=
X-Received: by 2002:a05:7300:bc10:b0:2c8:1d56:340c with SMTP id
	5a478bee46e88-2d58946284amr593276eec.23.1775783676253; 
	Thu, 09 Apr 2026 18:14:36 -0700 (PDT)
Received: from ?IPV6:2600:380:873e:380f:e9e5:ea98:a905:9cbb?
	([2600:380:873e:380f:e9e5:ea98:a905:9cbb])
	by smtp.gmail.com with ESMTPSA id
	5a478bee46e88-2d561bde68bsm2097787eec.17.2026.04.09.18.14.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Apr 2026 18:14:35 -0700 (PDT)
Message-ID: <0cf7c152-a341-40e3-8359-23a633c812c6@kernel.dk>
Date: Thu, 9 Apr 2026 19:14:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] DRBD 9 rework
To: Christoph Hellwig <hch@infradead.org>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
	<ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
	<adXk_m3SbRcWTOIC@infradead.org>
	<c92d5318-8c8e-434f-835e-61cf1fae4edf@kernel.dk>
	<addJ6uTc8Zo4GKpW@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <addJ6uTc8Zo4GKpW@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.810];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 39A973D1077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 12:40 AM, Christoph Hellwig wrote:
> First an apology, I thought it was in your tree, but it looks like
> the drbd branch just has minor fixes.  So a lot less urgency.

No worries, figured you hadn't seen the previous discussion.

> On Wed, Apr 08, 2026 at 06:58:58AM -0600, Jens Axboe wrote:
>> See the previous discussion,
> 
> Do you have a pointer to that discussion?  I can't remember one.

I'm on pretty poor connectivity right now, but find some of my complaining
on linux-block in response to a previous Christian email.

>> the goal is to sync the two drbd code
>> bases. It's followed the "usual" pattern of the in-kernel driver being
>> neglected and development and users pushed to the out-of-tree one,
>> which is highly annoying.
> 
> I don't think that's a a usual pattern.  Also the new version looks
> like a complete rewrite and not something incremental:
> 
>  45 files changed, 45891 insertions(+), 16264 deletions(-)
> 
> For a code base that is "29482 total".
> 
> I think reviewing it would be easier by just adding an new drbd9 driver
> and then steering people toward it carefully, as that is actually
> reviewable compared to non-bisectable patches changing large chunks
> of code in a non-atomic way.

That is another approach we could take, but I don't think that would
make it any easier to review, to be honest. Nobody reviews a full
driver, their eyes just kind of gloss over.

Heads up - OOO for 1 week, will prep merge window stuff to the best
of my abilities, but won't be super responsive outside of that. As
this particular driver isn't going anywhere right now, there's no
urgency on that side of things.

-- 
Jens Axboe

