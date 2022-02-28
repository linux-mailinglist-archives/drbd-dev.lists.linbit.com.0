Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F083F4C7962
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 21:03:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5A3A420835;
	Mon, 28 Feb 2022 21:03:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F9254205DD
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 21:03:26 +0100 (CET)
Received: by mail-ej1-f46.google.com with SMTP id p14so27047374ejf.11
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
	b=Tm2RrZZp9rg85Q2lAdsba4a3IH+hQMy5xZCbUizCCXmPzyfZ+2VRqEslWXZB4tPt3B
	Xz8lYe63CHEdQCuWSaPC9nNMhFWrnR54Ihwd0u2qPZVZ4zvhHacXKCw+SJS4BR1PfT62
	xCFGBc0xrmrOEo0QPHvZeTHUhXNuWYmty+udI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
	b=OALFbYuPegLTg6PleLsXDr2k68+Q9p/pYuKPOP1YQFpThUbinaWwdk3uDPDJlK0Psj
	FsyJ2ftmrMGyLEfHIbeDINYSuyRMgk+/ETuBuQSmMDc72wWexr/Pt0oeaWnmO59JwhaC
	Rzblbn32NIy3V+0igFF2YgZQk9YFmiSYbUVZ/jnVgLHoEWBs90nyJ63G13dnI21Xu7Hi
	RgchHOmu6dOcNg9yWt447p5JLQPm4oKEzz7QAhNeLdkA2B3fLbNxuXOIcZ8CSZM5qZbC
	K4bnluxaCfnl9jsREFDdPYo/RU9toSlkLfRh1362KMSvbQb4YF8WA8x9JwuxPUVHR1jX
	yC9g==
X-Gm-Message-State: AOAM530eRfgSKSBfFz5YQgwIqN+pdI46j6U3rAZLHn/VC6b3wjYLS/+K
	nXzm2g/obY97FQDUDsoTQDAt+3m1FeoX+0OiVkw=
X-Google-Smtp-Source: ABdhPJy6xp+7+qWykePkQ+gVc7WzJdgX7uO+lmjvhRcAiMRldzkLq3gQxsceW7QbLC4c6H/DqFJT7A==
X-Received: by 2002:a17:906:3e84:b0:6cf:cd36:6316 with SMTP id
	a4-20020a1709063e8400b006cfcd366316mr16306946ejj.581.1646078546397;
	Mon, 28 Feb 2022 12:02:26 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
	[209.85.208.44]) by smtp.gmail.com with ESMTPSA id
	w11-20020a056402128b00b00412ec3f5f74sm6385842edv.62.2022.02.28.12.02.26
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 28 Feb 2022 12:02:26 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id g20so19167354edw.6
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:02:26 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
	c19-20020ac25313000000b0044399c17e89mr13183568lfh.531.1646078183366;
	Mon, 28 Feb 2022 11:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
In-Reply-To: <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 11:56:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="00000000000064a3e305d91971a9"
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos,
	H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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

--00000000000064a3e305d91971a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 4:19 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> I don't think that using the extra variable makes the code in any way
> more reliable or easier to read.

So I think the next step is to do the attached patch (which requires
that "-std=3Dgnu11" that was discussed in the original thread).

That will guarantee that the 'pos' parameter of list_for_each_entry()
is only updated INSIDE the for_each_list_entry() loop, and can never
point to the (wrongly typed) head entry.

And I would actually hope that it should actually cause compiler
warnings about possibly uninitialized variables if people then use the
'pos' pointer outside the loop. Except

 (a) that code in sgx/encl.c currently initializes 'tmp' to NULL for
inexplicable reasons - possibly because it already expected this
behavior

 (b) when I remove that NULL initializer, I still don't get a warning,
because we've disabled -Wno-maybe-uninitialized since it results in so
many false positives.

Oh well.

Anyway, give this patch a look, and at least if it's expanded to do
"(pos) =3D NULL" in the entry statement for the for-loop, it will avoid
the HEAD type confusion that Jakob is working on. And I think in a
cleaner way than the horrid games he plays.

(But it won't avoid possible CPU speculation of such type confusion.
That, in my opinion, is a completely different issue)

I do wish we could actually poison the 'pos' value after the loop
somehow - but clearly the "might be uninitialized" I was hoping for
isn't the way to do it.

Anybody have any ideas?

                Linus

--00000000000064a3e305d91971a9
Content-Type: application/octet-stream; name=p
Content-Disposition: attachment; filename=p
Content-Transfer-Encoding: base64
Content-ID: <f_l073sb6w0>
X-Attachment-Id: f_l073sb6w0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGlzdC5oIGIvaW5jbHVkZS9saW51eC9saXN0LmgK
aW5kZXggZGQ2YzIwNDFkMDljLi5iYWI5OTU1OTZhYWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvbGlzdC5oCisrKyBiL2luY2x1ZGUvbGludXgvbGlzdC5oCkBAIC02MzQsMTAgKzYzNCwxMCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgbGlzdF9zcGxpY2VfdGFpbF9pbml0KHN0cnVjdCBsaXN0X2hl
YWQgKmxpc3QsCiAgKiBAaGVhZDoJdGhlIGhlYWQgZm9yIHlvdXIgbGlzdC4KICAqIEBtZW1iZXI6
CXRoZSBuYW1lIG9mIHRoZSBsaXN0X2hlYWQgd2l0aGluIHRoZSBzdHJ1Y3QuCiAgKi8KLSNkZWZp
bmUgbGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJXAotCWZvciAocG9z
ID0gbGlzdF9maXJzdF9lbnRyeShoZWFkLCB0eXBlb2YoKnBvcyksIG1lbWJlcik7CVwKLQkgICAg
ICFsaXN0X2VudHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpOwkJCVwKLQkgICAgIHBvcyA9
IGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikpCisjZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50
cnkocG9zLCBoZWFkLCBtZW1iZXIpCQkJCQlcCisJZm9yICh0eXBlb2YocG9zKSBfX2l0ZXIgPSBs
aXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVvZigqcG9zKSwgbWVtYmVyKTsJXAorCSAgICAgIWxp
c3RfZW50cnlfaXNfaGVhZChfX2l0ZXIsIGhlYWQsIG1lbWJlcikgJiYgKCgocG9zKT1fX2l0ZXIp
LDEpOwlcCisJICAgICBfX2l0ZXIgPSBsaXN0X25leHRfZW50cnkoX19pdGVyLCBtZW1iZXIpKQog
CiAvKioKICAqIGxpc3RfZm9yX2VhY2hfZW50cnlfcmV2ZXJzZSAtIGl0ZXJhdGUgYmFja3dhcmRz
IG92ZXIgbGlzdCBvZiBnaXZlbiB0eXBlLgo=
--00000000000064a3e305d91971a9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--00000000000064a3e305d91971a9--
