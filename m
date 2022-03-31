Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 692394EE47E
	for <lists+drbd-dev@lfdr.de>; Fri,  1 Apr 2022 01:09:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 588E8420600;
	Fri,  1 Apr 2022 01:09:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69BF04201DC
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 01:09:54 +0200 (CEST)
Received: by mail-pf1-f179.google.com with SMTP id s11so942188pfu.13
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=cz3GyvYVzV3EdDN6sB+1FTc+c9hwF2tdZTNimFcZLNE=;
	b=H+ydDUAE3ArEgOwqdy5OxWseMKcHyBBJkrf6rlBsJ08wAxF9Cfxer5aaRBdgBo+lBD
	7Tr10y0n0emtB4xE73WkxCkt40MOlRQBb6a3WGikOLrM+Cho5mM51lIxbW4CLargfshe
	B45zfCaSVIKHhhRW/+TdaeCB+we/UQZMTIC4MfIpodgd2jcW2O3V3rBOy7DMLx8/7FQQ
	cUoJWnYDQtTkx8IxrPIcqLPUg1uRBPf8v8PH+tKE0CM80Il166tAXfLdoV9Plju11dCo
	WAwF170/GBBWVDX2RmCp+IAFgBIG06mIP9pmIznSuBaxb/RkhFvHvz5v3Dk/8zXfggW2
	R4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=cz3GyvYVzV3EdDN6sB+1FTc+c9hwF2tdZTNimFcZLNE=;
	b=ZWZGggMTmQ2oYRCASShJgwqkGtih4vpvKxgDukDTU2UXwItU6MvAgJysuzBYDVXS1+
	8KKZLxDtZBieAP6JRWZFtMimAyf7KuY+Dgcj/44kMkszYR830/Ncd5UWefxm+6F3n8b/
	m8soJyIrCf2kphF4KEOczaxXPiosnj8ox3Q2OE1nY/WiFeoW/OyJxZKnLcVvwAsXmCam
	3SmdZNdnMr03c069jwvJuWLlBPFpYX2ZZCGNZ40HxTH46UqSg5dkNubszV3+5CNviZom
	2FBke9iW/9xx3QvLDGpl7eJ6C6xp4aJF3/eqaWuL8VnTIe8xkZsbXBq+GC4YYdnXKSPo
	cakA==
X-Gm-Message-State: AOAM5318cKb4ctwoc28ppJrDbK3Crahm77RFjW7EUfTZtsiUdook9VSe
	AupR4K7wuc6/lT/hqeY4yFO/Vg==
X-Google-Smtp-Source: ABdhPJytWJ8U0yLRH8Kl35OBWcKwI3vz+SnWKsJfk0otE+SEsTGPONodJMMiXqpN14jZTP8fDBsXYw==
X-Received: by 2002:a63:d149:0:b0:384:b288:8704 with SMTP id
	c9-20020a63d149000000b00384b2888704mr12390321pgj.112.1648768193276;
	Thu, 31 Mar 2022 16:09:53 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	b16-20020a056a00115000b004f6ff260c9esm516225pfm.207.2022.03.31.16.09.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 31 Mar 2022 16:09:52 -0700 (PDT)
Message-ID: <078e8084-8fea-5b69-89a6-9488a28163cf@kernel.dk>
Date: Thu, 31 Mar 2022 17:09:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Jakob Koschel <jakobkoschel@gmail.com>
References: <20220331220349.885126-1-jakobkoschel@gmail.com>
	<20220331220349.885126-2-jakobkoschel@gmail.com>
	<4dcedb78-355f-ed1a-9af1-27e9e63b5643@linbit.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <4dcedb78-355f-ed1a-9af1-27e9e63b5643@linbit.com>
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	linux-block@vger.kernel.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Mike Rapoport <rppt@kernel.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/2] drbd: remove check of list iterator
 against head past the loop body
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

On 3/31/22 4:28 PM, Christoph B?hmwalder wrote:
> Am 01.04.22 um 00:03 schrieb Jakob Koschel:
>> When list_for_each_entry() completes the iteration over the whole list
>> without breaking the loop, the iterator value will be a bogus pointer
>> computed based on the head element.
>>
>> While it is safe to use the pointer to determine if it was computed
>> based on the head element, either with list_entry_is_head() or
>> &pos->member == head, using the iterator variable after the loop should
>> be avoided.
>>
>> In preparation to limit the scope of a list iterator to the list
>> traversal loop, use a dedicated pointer to point to the found element [1].
>>
> 
> Hi Jakob,
> 
> Both of these look good to me, thanks.
> 
> Reviewed-by: Christoph B?hmwalder <christoph.boehmwalder@linbit.com>

Applied both, but shortened title of this commit. Jakob, please keep it
within the usual 74 chars. In general, it's great to use a cover letter
for anything that's more than one patch. Just some pointers if you're
doing more of these.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
