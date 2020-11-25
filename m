Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD92C460F
	for <lists+drbd-dev@lfdr.de>; Wed, 25 Nov 2020 17:56:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 59EAD420622;
	Wed, 25 Nov 2020 17:56:15 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0DD5B420069
	for <drbd-dev@lists.linbit.com>; Wed, 25 Nov 2020 13:24:39 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id e8so2183683pfh.2
	for <drbd-dev@lists.linbit.com>; Wed, 25 Nov 2020 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9IH0l2L/ELs04A0W/6GC4nhC0e+RvRGWJ1bAzD1+dFc=;
	b=GyrkIL7rJc/Wrkz9wtYqXZYvGBry6qXFkQono0nmrBFDlUCiGmbX9ByD1wUhih87ZW
	XCd/8etF0h65aGuVNHVvGVnSoIRV2cIFxWeuMsMEKDZ+SIKsK6eM3KIHPaY2Au+pxfCB
	jFmSmO0a8jtSnIjbAi/709gkMW9hnqxggrhUNIGI/2GrlejcLn7tyz9MFlSEpE31y19Z
	9ARaZhNBbaKZzII6ioDoEFmbbi01XI+4/fF65wWR3SGfZuCMoV2cgGUJ8Osa8sFeqdbz
	KLllcyBsC3gtRPDbq4Yc+z3inKaZT7D05cYTb7CBHNDdR/afLH0A7E5JHrBWilMAefn4
	uS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9IH0l2L/ELs04A0W/6GC4nhC0e+RvRGWJ1bAzD1+dFc=;
	b=IApYQQ3uaEFtC8vi13lEKjFB6dFETxn0B+no0C0DIwn6GIAcMIHQHQcnwZ4wWPnCjo
	71kegaMBRn2YuHdO0a5qyM1FMHV1vWhTXVgeY3ektd09SOvyeKRb6KQ/yy8n5Xj/l7mt
	9P6KAliNvBGWfo4snYGVBs2ebAWtItN8ZbXV9NZd19hNnlv8KJEoG6qJ7BBYpybvo2RY
	zatvMJPW4ybr3lwVhmepwp1Pu56qgd9g7BlVuTXvEeBpd8QxQnAkCWEbAGcSsy6VaE6I
	hA3aV/zJwv2kGPF15XaYX18JrgClQLJLJiUiP33r5Pm6PtHc9D63vDr74MfONAmLSE9p
	v/Iw==
X-Gm-Message-State: AOAM533YQZwIZX5nxuDy5/KiQszlk6LjuN8hfUcGTvPCnJdnrd7kK1u4
	BlVWyZdBSOIRQfRe4sFi6TVoRHpaaGmq59bKPyjx2Q==
X-Google-Smtp-Source: ABdhPJySo35UzNwHodlreVMfJuWPwHO1z+zkcbFfSYU3Avf+sN4n16LJPBb97SBockWyJEKx3Xs8q1wCvzejZmwrmAM=
X-Received: by 2002:a62:7905:0:b029:197:f300:5a2a with SMTP id
	u5-20020a6279050000b0290197f3005a2amr2898775pfc.30.1606307078380;
	Wed, 25 Nov 2020 04:24:38 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	<0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	<d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	<dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	<20201123130348.GA3119@embeddedor>
	<8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
	<202011241327.BB28F12F6@keescook>
	<a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
In-Reply-To: <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2020 04:24:27 -0800
Message-ID: <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mailman-Approved-At: Wed, 25 Nov 2020 17:56:12 +0100
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	target-devel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
	samba-technical@lists.samba.org, linux-fbdev@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	linux-mmc@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net,
	linux-wireless <linux-wireless@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [Drbd-dev] [Intel-wired-lan] [PATCH 000/141] Fix fall-through
	warnings for Clang
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

On Tue, Nov 24, 2020 at 11:05 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2020-11-24 at 13:32 -0800, Kees Cook wrote:
> > We already enable -Wimplicit-fallthrough globally, so that's not the
> > discussion. The issue is that Clang is (correctly) even more strict
> > than GCC for this, so these are the remaining ones to fix for full
> > Clang coverage too.
> >
> > People have spent more time debating this already than it would have
> > taken to apply the patches. :)
>
> You mean we've already spent 90% of the effort to come this far so we
> might as well go the remaining 10% because then at least we get some
> return? It's certainly a clinching argument in defence procurement ...

So developers and distributions using Clang can't have
-Wimplicit-fallthrough enabled because GCC is less strict (which has
been shown in this thread to lead to bugs)?  We'd like to have nice
things too, you know.

I even agree that most of the churn comes from

case 0:
  ++x;
default:
  break;

which I have a patch for: https://reviews.llvm.org/D91895.  I agree
that can never lead to bugs.  But that's not the sole case of this
series, just most of them.

Though, note how the reviewer (C++ spec editor and clang front end
owner) in https://reviews.llvm.org/D91895 even asks in that review how
maybe a new flag would be more appropriate for a watered
down/stylistic variant of the existing behavior.  And if the current
wording of Documentation/process/deprecated.rst around "fallthrough"
is a straightforward rule of thumb, I kind of agree with him.

>
> > This is about robustness and language wrangling. It's a big code-
> > base, and this is the price of our managing technical debt for
> > permanent robustness improvements. (The numbers I ran from Gustavo's
> > earlier patches were that about 10% of the places adjusted were
> > identified as legitimate bugs being fixed. This final series may be
> > lower, but there are still bugs being found from it -- we need to
> > finish this and shut the door on it for good.)
>
> I got my six patches by analyzing the lwn.net report of the fixes that
> was cited which had 21 of which 50% didn't actually change the emitted
> code, and 25% didn't have a user visible effect.
>
> But the broader point I'm making is just because the compiler people
> come up with a shiny new warning doesn't necessarily mean the problem

That's not what this is though; you're attacking a strawman.  I'd
encourage you to bring that up when that actually occurs, unlike this
case since it's actively hindering getting -Wimplicit-fallthrough
enabled for Clang.  This is not a shiny new warning; it's already on
for GCC and has existed in both compilers for multiple releases.

And I'll also note that warnings are warnings and not errors because
they cannot be proven to be bugs in 100% of cases, but they have led
to bugs in the past.  They require a human to review their intent and
remove ambiguities.  If 97% of cases would end in a break ("Expert C
Programming: Deep C Secrets" - Peter van der Linden), then it starts
to look to me like a language defect; certainly an incorrectly chosen
default.  But the compiler can't know those 3% were intentional,
unless you're explicit for those exceptional cases.

> it's detecting is one that causes us actual problems in the code base.
> I'd really be happier if we had a theory about what classes of CVE or
> bug we could eliminate before we embrace the next new warning.

We don't generally file CVEs and waiting for them to occur might be
too reactive, but I agree that pointing to some additional
documentation in commit messages about how a warning could lead to a
bug would make it clearer to reviewers why being able to enable it
treewide, even if there's no bug in their particular subsystem, is in
the general interest of the commons.

On Mon, Nov 23, 2020 at 7:58 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> We're also complaining about the inability to recruit maintainers:
>
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
>
> And burn out:
>
> http://antirez.com/news/129
>
> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches ... I'm pushing back
> on that assumption in two places, firstly the valulessness of the time
> and secondly that all trivial patches are valuable.

It's critical to the longevity of any open source project that there
are not single points of failure.  If someone is not expendable or
replaceable (or claims to be) then that's a risk to the project and a
bottleneck.  Not having a replacement in training or some form of
redundancy is short sighted.

If trivial patches are adding too much to your workload, consider
training a co-maintainer or asking for help from one of your reviewers
whom you trust.  I don't doubt it's hard to find maintainers, but
existing maintainers should go out of their way to entrust
co-maintainers especially when they find their workload becomes too
high.  And reviewing/picking up trivial patches is probably a great
way to get started.  If we allow too much knowledge of any one
subsystem to collect with one maintainer, what happens when that
maintainer leaves the community (which, given a finite lifespan, is an
inevitability)?
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
