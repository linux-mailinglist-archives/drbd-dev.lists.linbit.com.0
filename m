Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA40309D43
	for <lists+drbd-dev@lfdr.de>; Sun, 31 Jan 2021 16:06:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE4294205FF;
	Sun, 31 Jan 2021 16:06:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6DA11420308
	for <drbd-dev@lists.linbit.com>; Sun, 31 Jan 2021 16:06:09 +0100 (CET)
Received: by mail-pf1-f179.google.com with SMTP id o20so9856330pfu.0
	for <drbd-dev@lists.linbit.com>; Sun, 31 Jan 2021 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RhAfW3bOZ/JfCqopnjfz8hQSvqyWBPdhdc6w/zDiwfc=;
	b=IuEYztJTmZOs0kVtPjKiHZTmlePgiPP90jNwlu7kB0YG9jG1mKAoE771JYPnoB+d3s
	7qYP8K7lWDPtq9EOszLpt9J17q0um0JnaJuFIWJy9UcWwyBJQjfZ1EP3NWWnN7C5U+d1
	C8UepgnzBNj+bK8L0ipZFYzLtAcgC2CKj1WpmSe8kqzByWUL1OBceXEGDaTsY1VKLE9D
	lP/6IehcIgj4OYhEacOjra0NC0R4BCqBczxMGbpKb+SxfPRPvQRW6XNPqxeyOdErN5JT
	Xp1jnN+1wjwAxsumwoIbJ0Ft+loZsWg7EojlasfXNk/+T3/IJLu2Xvp/T4+KrTx0YtL7
	49bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RhAfW3bOZ/JfCqopnjfz8hQSvqyWBPdhdc6w/zDiwfc=;
	b=pu/3XkUJDqUg5nlUAQd0M4Lh7BsP6SSYUbYy5ZZTk/8TZWcyXh/qvGH0RNxyZL6Qzx
	kEM9VXFt3PnukoBp6B0ONpEIaaY5hY0KaEzxXCaA4gj3EhOaEGQZKVDwJixxJ9r3kFeg
	8DcxHmONrjcaOz66DOwG5u0S9vifFY6kDYPqETit3cQN95G08Duyuxi5E73mDJKdsFIt
	B540/6qMp9MXN642t8adQnRwOsEJypmT7QYMvjMnqHmi5aqPS1e5QApGDbhOOcETThDM
	c6maaqTI6JsO6nYkb5mruh+FT5pKip/sRFuVolnwqE9Jdm659pAU2h1Qhih0uO+Ht+lk
	emMw==
X-Gm-Message-State: AOAM532Rk8H+RBTav2+gdQm2dfI3KqN+K0XoKWU21uo2kBYnEpIGh1yC
	4hHxLqo8TJ8kOyNFlPixq6Lg/A==
X-Google-Smtp-Source: ABdhPJwIrY3pQVuft9bDOjJNjgrxQ/cadRkh846SmN1+jYXqxUz3/NqaB3dVRUWbkzUeNQQTZX3MkQ==
X-Received: by 2002:a63:1c42:: with SMTP id c2mr13354451pgm.304.1612105568223; 
	Sun, 31 Jan 2021 07:06:08 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id
	c17sm14357248pfi.88.2021.01.31.07.06.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 31 Jan 2021 07:06:07 -0800 (PST)
To: Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <cover.1598331148.git.joe@perches.com>
	<1c8081264d82101d7837220c5ee221c307da5d91.1598331148.git.joe@perches.com>
	<5deee552f4bcfd81c6dc6ec3e8139c0c4ba27d31.camel@perches.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8a2099ab-9b25-d79c-f421-0a3a2ca15720@kernel.dk>
Date: Sun, 31 Jan 2021 08:06:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5deee552f4bcfd81c6dc6ec3e8139c0c4ba27d31.camel@perches.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 06/29] drbd: Avoid comma separated statements
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

On 1/30/21 11:57 AM, Joe Perches wrote:
> On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
>> Use semicolons and braces.
> 
> ping?

Queued for 5.12.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
