Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F71F82EC
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:26:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 57E6B4203FE;
	Sat, 13 Jun 2020 12:26:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43F6C4203F4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:20 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id r9so10052968wmh.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=Hll+dJXiojyLXcK519mMreswBK6PHaxvzDLgh0p26WU=;
	b=flGq1Sbf/iD9YRydCAmApxLRBLkmR4HTSwecey44uWE59hoc0Jz42lBDSoJozFQ5B8
	3kN2KpjzQMTpn441+6nJ0c40aOGNxS/ozgd0/SKKCBfhljYYg4hfCNFm6pu6jPVU3Qe0
	W1vovI7ZlkekwZD7ZAZXSzlrsFn8SveuAFa8chkrb8n5F5Yi3a+88QR+2/MdBxrFrD2t
	dt5b0ktdrLX1agxUP+fIis7wNpBTLJ+KUr9tctvSn27hQXoE00mQ6lTpwrVoNNQiFpiz
	QDw6/u7Y8gtWAqli2Gn3326BReB+Yv76h0g5fLDhzn7d1x8EJIToCHcSEOMeuS/7JGio
	x/8Q==
X-Gm-Message-State: AOAM530M+loHm4bpzLmbw3JVNon7+hcIYlzSk8LUfOW0JAq/Lj0tkojD
	glL2UY1nYaSe+uIhdjg4JipF8DkGKlvNH7Uk
X-Google-Smtp-Source: ABdhPJw7hOrzmac4tPthqsPynqsInL3cnXnrVvemRm5SveTgF5YlKLvgdMLkc354HZJSYsT5e9ebCA==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr3179678wme.14.1592042359699;
	Sat, 13 Jun 2020 02:59:19 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	f71sm11867290wmf.22.2020.06.13.02.59.18
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:19 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:17 +0200
Resent-Message-ID: <20200613095917.GL4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F94C420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 17:22:27 +0200 (CEST)
Received: by mail-lj1-f194.google.com with SMTP id m18so7797886ljo.5
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hll+dJXiojyLXcK519mMreswBK6PHaxvzDLgh0p26WU=;
	b=L2DmN0uXC2KyUjBXJZi+YdM6TZcgHaAo/hwU1tP/L4478bcM5q0UoroK+b7mXP2R4P
	CY4dtFPVvkSyAVNSadDFjTzPdwsP+D6eUqcI3kZvGZ6ajCkMMqMOFbgr3IfT104hlH1u
	lRWeEsjQCwyQyAj9FSqtUsV2OVn1GCiiakgSfTvZ8K2MYTUl7u0hUTkpplg3e1KrWY/9
	snhpOMwvfzp6FxIPzFqDy43iUYePSSShfDdso4J4gku4w5tWVs2i8FRQHbva/jSkg7vd
	YZLPjLfOXFlhjCK9IXDlSvavi8M3D5kpvb1fwEUGzSEYis+R9Un5BXefFLYIPHMBjNN1
	WgrQ==
X-Received: by 2002:a2e:a544:: with SMTP id e4mr2625204ljn.264.1591284147467; 
	Thu, 04 Jun 2020 08:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-2-keescook@chromium.org>
	<874krr8dps.fsf@nanos.tec.linutronix.de>
	<CANiq72kLqvriYmMkdD3yU+xJwbn-68Eiu-fTNtC+Lb+1ZRM75g@mail.gmail.com>
	<202006040745.525ECD1@keescook>
In-Reply-To: <202006040745.525ECD1@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2020 17:22:15 +0200
Message-ID: <CANiq72mHhzfPMGbBn=NZfqLeejPG+t=GN++NJ-L0hg-2x4UPag@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>, Linux-MM <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Thomas Gleixner <tglx@linutronix.de>,
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

On Thu, Jun 4, 2020 at 4:56 PM Kees Cook <keescook@chromium.org> wrote:
>
> Er? That's not what it looked like to me:
>
> #define IS_BUILTIN(option) __is_defined(option)
> #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
>
> But just to be sure, I just tested in with a real build:
>
> [    3.242160] IS_ENABLED(TEST_UNDEF) false
> [    3.242691] __is_defined(TEST_UNDEF) false
> [    3.243240] IS_ENABLED(TEST_VALUE_EMPTY) false
> [    3.243794] __is_defined(TEST_VALUE_EMPTY) false
> [    3.244353] IS_ENABLED(TEST_VALUE_1) true
> [    3.244848] __is_defined(TEST_VALUE_1) true
>
> and nope, it only works with a defined value present.

You are right, it follows the Kconfig logic, returning false for
defined-but-to-0 too.

We should probably add an `IS_DEFINED()` macro kernel-wide for this
(and add it to the `coding-guidelines.rst` since `IS_ENABLED()` is
mentioned there, with a warning not to mix it with `__is_defined()`
which looks it was only intended as an implementation detail for
`include/linux/kconfig.h`).

CC'ing Masahiro by the way.

Cheers,
Miguel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
