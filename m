Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6B4FC044
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Apr 2022 17:21:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 308104202F4;
	Mon, 11 Apr 2022 17:21:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 24EF2420124
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 17:21:12 +0200 (CEST)
Received: by mail-ed1-f46.google.com with SMTP id d10so18940385edj.0
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gEnQjPM4eB6GBqG0Y/NfF0bmxz/lX8KWWpdu0GytdXE=;
	b=JWjd9m95I16EJ4/BwCzkpH/mr9XqPq2eIJW6/sOLZ8thIn5dWKmXyAbx1ghKtzX5Ff
	58BCI1HywLQfht9lyP89N2juy1ngDN5pq3gUA0ncEXgnuYpc2w3zIfSAbTxGe7LEXisH
	3OZonLh2UxLwF3jCeg1gZX6GFL0HPpm7k0OwDi/0eJPLoUi+3GwUUxfgGQ3PRRzY/XoN
	ZEFQ769wPH3qZDpWMk8fPBMR+g3hhAn9lj7LAE6WgwD+J2xzcwpKNTELpSbmJtMMuNoi
	u+S9ZzWPqCjJMtNJbin1dKuT61q+dUqu0v002/m/aBRaZqW9In1/MsOq7cuhcZl0S8nX
	16kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gEnQjPM4eB6GBqG0Y/NfF0bmxz/lX8KWWpdu0GytdXE=;
	b=rilwkWj36wlavk6XKes+pS9dF0AfupMbxsCaq9KYSCH2FjyEbrWPNzeY6hV7YVjliE
	iVawvn/L2vohAdRC87yJ6HEO+1D4PX5FuXCsR7FeMoHqfShEHl48be08fToaLoOVn/Zq
	Qk/NXaYsJbWX46q117+DzDbJ4TNNq/r+SwR6VS4Kitta6OKQqYgDdKbCjCCCcZrOp3it
	9Jtyatq4O8/JEzrKMo6uaGzRg3WOFK/i4wW+iKyOjuRgF5K90zx4mqqshYJwxbtY0dsK
	fBWIMlczATo6KqwFmYk1XbRh8r7BL5BnjbXREwszZ66OcMVODa9j+864Kh8ZLGeg+o1h
	2VDQ==
X-Gm-Message-State: AOAM531UYRXMmO8My9HHZwiDtfvY8vVKer7SOybDjLERgYMFyedAJvFe
	pdbdwFK9ElWV+8lYVhPGEFxEJaEP3HWcjgnQXIA5W1Kg
X-Google-Smtp-Source: ABdhPJyP8J0LOueeeM/ZO9NCAGXnsfNQIPX5HnVmrzH89AYHovObDF9XmAIccXF+PHS7ZL/l97OuCf7cnXqsw+vQLfE=
X-Received: by 2002:a05:6402:84b:b0:419:105:f516 with SMTP id
	b11-20020a056402084b00b004190105f516mr34279188edz.3.1649690472480;
	Mon, 11 Apr 2022 08:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220411120204.3683999-1-rui.xu@easystack.cn>
In-Reply-To: <20220411120204.3683999-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 11 Apr 2022 17:21:01 +0200
Message-ID: <CAGNP_+WSFxF3Jzb7ozJMjSsOEDxLR6n_CMt58NHzmyOJErjfng@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd:clear NEW_CUR_UUID when uuid was
	actually created
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

Hi Xu,

You mentioned in your other message that this patch is intended for DRBD 9.0.
https://lists.linbit.com/pipermail/drbd-dev/2022-April/006577.html

I'm afraid that the 9.0 branch is end-of-life, so this won't be
applied. The drbd-9.1 branch is the place for improvements, especially
since it already contains related fixes to the handling of suspended
IO due to quorum loss.

Thank you for your participation in the project nevertheless!

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
