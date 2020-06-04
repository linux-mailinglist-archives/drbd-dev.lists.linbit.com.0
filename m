Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C21F82FC
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:32:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E0355420404;
	Sat, 13 Jun 2020 12:32:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87F84420443
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:58 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id q25so10179452wmj.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:in-reply-to:references:date:message-id
	:mime-version;
	bh=EJURT4SMM5RFVtYvkGpafF5q0/k/tbkIdIs3fJmqyXE=;
	b=b+9wDlh8sD6uZ6zpKZj1FHjlOwYWiA09QnH9YyzDXRDowWpYqSyvKuaSQxGFDS+5Kx
	DKrbex83aCj3yAALMS1KdKoam5H1c16ky+ZM5pMGW37ZyR25DzVOuhm8i3cKpoocGv9+
	2fq/q0SfmYYA8OnJbF/sSlOSyHPRoY+oOjn7CFJPShT8najlkM329ZxSpIJg5JMdIanH
	Ya6007YaFfOsnNI4FMOEchFtZS2Sy1HvcWdnM4bsn4KqMs9NUxkS0+YXB8ihhimuPVTh
	LUdnK6COU/X16n7mThwUndKCGpou0ZUFRqKNrkwMovRu5iVn7UaL/QZOdqDoIlzfTfhy
	5AsQ==
X-Gm-Message-State: AOAM532VQwd8XcoFXlQwCL3Y3eYiXOsLgh1LPytvE1qmL32p/rhMNW5K
	bp65CswXNqhHNXTxnF9upL4jp9LqRks8OaT+
X-Google-Smtp-Source: ABdhPJz98mr5Fyg8Lup8L8FKopRdHV1xj3+04JH4r3MVm3jibW1kvnTyaVsKvc5vaCa8/hrWW8U7VQ==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr3375037wmk.91.1592042397993;
	Sat, 13 Jun 2020 02:59:57 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	k12sm14335490wrn.42.2020.06.13.02.59.57
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:57 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:55 +0200
Resent-Message-ID: <20200613095955.GW4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 326CD420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 23:39:13 +0200 (CEST)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
	helo=nanos.tec.linutronix.de) by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1jgxZr-0001Jg-Vu; Thu, 04 Jun 2020 23:39:08 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
	id E240BFFBE0; Thu,  4 Jun 2020 23:39:05 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Kees Cook <keescook@chromium.org>
In-Reply-To: <202006040728.8797FAA4@keescook>
References: <20200603233203.1695403-2-keescook@chromium.org>
	<874krr8dps.fsf@nanos.tec.linutronix.de>
	<202006040728.8797FAA4@keescook>
Date: Thu, 04 Jun 2020 23:39:05 +0200
Message-ID: <87zh9i7bpi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
	SHORTCIRCUIT=-0.0001
Cc: Andy Whitcroft <apw@canonical.com>, clang-built-linux@googlegroups.com,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] x86/mm/numa: Remove
	uninitialized_var() usage
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

Kees Cook <keescook@chromium.org> writes:
>> > -#define NODE_NOT_IN_PAGE_FLAGS
>> > +#define NODE_NOT_IN_PAGE_FLAGS 1
>> 
>> but if we ever lose the 1 then the above will silently compile the code
>> within the IS_ENABLED() section out.
>
> That's true, yes. I considered two other ways to do this:
>
> 1) smallest patch, but more #ifdef:
> 2) medium size, weird style:
>
> and 3 is what I sent: biggest, but removes #ifdef
>
> Any preference?

From a readbility POV I surely prefer #3. i"m just wary. Add a big fat
comment to the define might mitigate that, hmm?

Thanks,

        tglx
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
